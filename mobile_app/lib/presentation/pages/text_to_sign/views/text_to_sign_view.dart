import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/text_to_sign_controller.dart';

class TextToSignView extends GetView<TextToSignController> {
  const TextToSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF0085FF),
          title: const Text('Text/speech to sign'),
          centerTitle: true,
          actions: [
            Tooltip(
              key: controller.toolTipKey,
              message:
                  'Long press the microphone icon to record or enter text in the box below',
              triggerMode: TooltipTriggerMode.manual,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
              preferBelow: true,
              verticalOffset: 20,
              showDuration: const Duration(seconds: 5),
              child: IconButton(
                  onPressed: () {
                    controller.toolTipKey.currentState?.ensureTooltipVisible();
                  },
                  icon: const Icon(Icons.question_mark)),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Obx(
                      () => SizedBox(
                          height: Get.height * 0.3,
                          child: controller.recognizing.value
                              ? Lottie.asset(Assets.image.icListening)
                              : Image.asset(Assets.image.intro1.path)),
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => controller.recognizing.value
                  ? const Text('Listening')
                  : const Text('Say or type something...')),
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
                        suffixIcon: GestureDetector(
                          onLongPress: () {
                            controller.start();
                          },
                          onLongPressEnd: (d) {
                            controller.stop();
                          },
                          child: const Icon(Icons.mic),
                        ),
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
                        showWebView(context,
                            query: controller.txtController.text);
                      },
                      icon: const Icon(Icons.send)),
                ],
              ),
            ))
          ],
        ));
  }

  showWebView(BuildContext context, {required String query}) {
    String initUrl = '${dotenv.get('WEBURL')}/?q=$query';
    log(initUrl);
    showGeneralDialog(
      context: context,
      barrierColor: Colors.white, // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            WebView(
              initialUrl: initUrl,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back_outlined),
                ),
                onTap: () => Navigator.pop(context),
              ),
            )
          ],
        );
      },
    );
  }
}
