import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_sign/di.dart';

import 'config/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      builder: BotToastInit(),
      getPages: AppPages.routes,
    );
  }
}