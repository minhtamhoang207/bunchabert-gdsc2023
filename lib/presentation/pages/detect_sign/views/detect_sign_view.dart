import 'package:better_player/better_player.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide MultipartFile;
import '../controllers/detect_sign_controller.dart';
import 'package:camera/camera.dart';

class DetectSignView extends GetView<DetectSignController> {
  const DetectSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Home()
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
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
      print("No any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            if (controller != null) {
              if (controller!.value.isInitialized) {
                image = await controller!.takePicture();
                var bytes = await image!.readAsBytes();
                var mpFile = MultipartFile.fromBytes(bytes);
                var status = await Get.find<DetectSignController>().getSignVideo(mpFile);
                if(status.isSuccess){
                  _showDialog();
                } else {
                  BotToast.showText(text: status.errorMessage??'');
                }
              }
            }
          } catch (e) {
            print(e); //show error
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
  _showDialog(){
    showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.9), // Background color
      barrierDismissible: true,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return const Center(
          child: MemoryPlayerPage(),
        );
      },
    ).then((value) => Get.back());
  }
}

class MemoryPlayerPage extends StatefulWidget {
  const MemoryPlayerPage({Key? key}) : super(key: key);

  @override
  _MemoryPlayerPageState createState() => _MemoryPlayerPageState();
}

class _MemoryPlayerPageState extends State<MemoryPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
    const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSource();
    super.initState();
  }

  void _setupDataSource() async {
    List<int> bytes = Get.find<DetectSignController>().bytes.value;
    BetterPlayerDataSource dataSource =
    BetterPlayerDataSource.memory(bytes, videoExtension: "mp4");
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(controller: _betterPlayerController),
      ),
    );
  }
}