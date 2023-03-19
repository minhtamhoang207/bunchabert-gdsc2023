import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_speech/config/recognition_config.dart';
import 'package:google_speech/config/recognition_config_v1.dart';
import 'package:google_speech/config/streaming_recognition_config.dart';
import 'package:google_speech/speech_client_authenticator.dart';
import 'package:google_speech/speech_to_text.dart';
import 'package:magic_sign/domain/usecases/sign_language_usecase.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class TextToSignController extends GetxController
    with StateMixin<TextToSignController> {
  final TextEditingController txtController = TextEditingController();

  final Rx<List<int>> bytes = Rx<List<int>>([]);

  TextToSignController({required this.signLanguageUseCases});
  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  SignLanguageUseCases signLanguageUseCases;

  RxBool recognizing = RxBool(false);
  RxBool recognizeFinished = RxBool(false);
  RxString text = RxString('');

  void recognize(String path) async {
    recognizing.value = true;
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/speech_to_text.json')));
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();
    final audio = await _getAudioContent(path);

    await speechToText.recognize(config, audio).then((value) {
      text.value =
          value.results.map((e) => e.alternatives.first.transcript).join('\n');
    }).whenComplete(
        () => {recognizeFinished.value = true, recognizing.value = false});
  }

  void streamingRecognize(String path) async {
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/speech_to_text.json')));
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        await _getAudioStream(path));

    responseStream.listen((data) {
      text.value =
          data.results.map((e) => e.alternatives.first.transcript).join('\n');
      txtController.value = TextEditingValue(text: text.value);
    }, onDone: () {});
  }

  Future<List<int>> _getAudioContent(String path) async {
    return File(path).readAsBytesSync().toList();
  }

  Future<Stream<List<int>>> _getAudioStream(String path) async {
    return File(path).openRead();
  }

  RecognitionConfig _getConfig() => RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 16000,
      languageCode: 'en-US');

  @override
  void onInit() async {
    change(this, status: RxStatus.empty());
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    super.onInit();
  }

  final _audioRecorder = Record();

  Future<void> start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        recognizing.value = true;
        await _audioRecorder.start(
            encoder: AudioEncoder.wav, samplingRate: 16000, numChannels: 1);
      }
    } catch (e) {
      recognizing.value = true;
      log(e.toString());
    }
  }

  Future<void> stop() async {
    recognizing.value = false;
    final path = await _audioRecorder.stop();
    if (path != null) {
      streamingRecognize(path);
    }
  }

  getSignVideo() async {
    try {
      change(this, status: RxStatus.loading());
      bytes.value =
          await signLanguageUseCases.getSignVideo(content: txtController.text);
      change(this, status: RxStatus.success());
    } catch (e) {
      log(e.toString());
      bytes.value = [];
      change(this, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _audioRecorder.dispose();
  }
}
