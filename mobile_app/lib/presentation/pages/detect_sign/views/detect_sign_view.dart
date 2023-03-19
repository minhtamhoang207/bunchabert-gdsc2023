import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import 'package:wavenet/wavenet.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/detect_sign_controller.dart';
import 'package:camera/camera.dart';

class DetectSignView extends GetView<DetectSignController> {
  const DetectSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;
  late TextToSpeechService _service;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    loadCamera();
    init();
    super.initState();
  }

  init() async {
    _service = TextToSpeechService(dotenv.get('TTSAPIKEY'));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      log("No any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
                width: Get.width,
                child: controller == null
                    ? const Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
          ),
          Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Center(
                      child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF4D4D4D),
                        label: Row(
                          children: const [
                            Icon(Icons.camera_enhance_outlined),
                            Gap(10),
                            Text('Text image to sign language'),
                          ],
                        ),
                        onPressed: () async {
                          try {
                            if (controller != null) {
                              if (controller!.value.isInitialized) {
                                image = await controller!.takePicture();
                                controller!.pausePreview();
                                if (image != null) {
                                  BotToast.showLoading();
                                  var status =
                                      await Get.find<DetectSignController>()
                                          .getSignVideo(File(image!.path));
                                  if (status.isSuccess) {
                                    BotToast.closeAllLoading();
                                    showWebView(
                                        query: Get.find<DetectSignController>()
                                            .finalResponse
                                            .value);
                                  } else {
                                    loadCamera();
                                    BotToast.closeAllLoading();
                                    BotToast.showText(
                                        text: status.errorMessage ?? '');
                                  }
                                }
                              }
                            }
                          } catch (e) {
                            loadCamera();
                            BotToast.closeAllLoading();
                            BotToast.showText(text: 'Something went wrong!');
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Center(
                      child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xFFB46060),
                        label: Row(
                          children: const [
                            Icon(Icons.video_camera_back_outlined),
                            Gap(10),
                            Text('Sign language video to text'),
                          ],
                        ),
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? video = await picker.pickVideo(
                              source: ImageSource.camera);
                          if (video != null) {
                            try {
                              BotToast.showLoading();
                              var status =
                                  await Get.find<DetectSignController>()
                                      .sign2text(File(video.path));
                              if (status.isSuccess) {
                                BotToast.closeAllLoading();
                                showListenAudioView(
                                    query: Get.find<DetectSignController>()
                                        .finalResponse
                                        .value);
                              } else {
                                loadCamera();
                                BotToast.closeAllLoading();
                                BotToast.showText(
                                    text: status.errorMessage ?? '');
                              }
                            } catch (e) {
                              loadCamera();
                              BotToast.closeAllLoading();
                              BotToast.showText(
                                  text: 'Something went wrong!'); //show error
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  showWebView({required String query}) {
    String initUrl = '${dotenv.get('WEBURL')}/?q=$query';
    log(initUrl);
    showGeneralDialog(
      context: context,
      barrierColor: Colors.white, // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 45, bottom: 100, left: 20, right: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const Gap(10),
                Expanded(
                    flex: 1,
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        Text(
                          query,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                Expanded(
                  flex: 6,
                  child: WebView(
                    initialUrl: initUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).then((value) async {
      await controller!.resumePreview();
    });
  }

  showListenAudioView({required String query}) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.white,
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 45, bottom: 100, left: 20, right: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const Gap(10),
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.only(top: 50),
                  children: [
                    Text(
                      'Result: $query',
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    )
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => SizedBox(
                              height: Get.height * 0.3,
                              child: Get.find<DetectSignController>()
                                      .playingAudio
                                      .value
                                  ? Lottie.asset(Assets.image.icListening)
                                  : const SizedBox(),
                            )),
                        InkWell(
                          onTap: () => _playAudio(query),
                          radius: 20,
                          child: const Icon(Icons.headset, size: 60),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    ).then((value) async {
      await loadCamera();
    });
  }

  void _playAudio(String text) async {
    final controller = Get.find<DetectSignController>();
    File file = await _service.textToSpeech(text: text);
    _audioPlayer.play(DeviceFileSource(file.path));
    controller.playingAudio.value = true;
    _audioPlayer.onPlayerStateChanged.listen((event) {
      switch (event) {
        case PlayerState.completed:
          controller.playingAudio.value = false;
          break;
        default:
          break;
      }
    });
  }
}
