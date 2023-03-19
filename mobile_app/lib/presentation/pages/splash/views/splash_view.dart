import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: 150,
        width: 150,
        child: CircleAvatar(
          backgroundImage: AssetImage(
            Assets.image.icLauncher.path,
          ),
        ),
      )),
    );
  }
}
