import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:magic_sign/gen/assets.gen.dart';

import '../controllers/text_to_sign_controller.dart';

class TextToSignView extends GetView<TextToSignController> {
  const TextToSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0085FF),
          title: const Text('Text/speech to sign'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: controller.obx(
                    (state) => state!.bytes.value.isEmpty
                        ? SizedBox(
                            height: Get.height * 0.3,
                            child: Image.asset(Assets.image.intro1.path))
                        : const MemoryPlayerPage(),
                    onLoading: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    onEmpty: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                          height: Get.height * 0.3,
                          child: Image.asset(Assets.image.intro1.path)),
                    )
                )
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.txtController,
                      maxLines: 5,
                      minLines: 5,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              await controller.startRecognizingWithUi();
                            },
                            icon: const Icon(Icons.mic)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide:
                              const BorderSide(width: 3, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (controller.txtController.value.text.isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.getSignVideo();
                        }
                      },
                      icon: const Icon(Icons.send)),
                ],
              ),
            ))
          ],
        ));
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
    List<int> bytes = Get.find<TextToSignController>().bytes.value;
    BetterPlayerDataSource dataSource =
        BetterPlayerDataSource.memory(bytes, videoExtension: "mp4");
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
