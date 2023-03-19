import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:magic_sign/config/routes/app_pages.dart';
import 'package:magic_sign/core/utils/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  IntroView({Key? key}) : super(key: key);

  late final Function goToTab;

  void onDonePress() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void onTabChangeCompleted(index) {
    log("onTabChangeCompleted, index: $index");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: AppColor.white,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: AppColor.white,
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: AppColor.white,
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33ffcc5c)),
    );
  }

  final List<IntroSliderModel> introItems = [
    IntroSliderModel(
      title: 'The best way to communicate with the deaf',
      content:
          'Supports conversion from voice/text\nto sign language and vice versa',
      image: Assets.image.intro1.path,
    ),
    IntroSliderModel(
      title: 'Support the deaf to\naccess information',
      content: 'Articles, videos, text images\ntranslated into sign language',
      image: Assets.image.intro2.path,
    ),
    IntroSliderModel(
      title: 'Learn sign language\nthe easy way',
      content:
          'Learn sign language easily\nthrough videos and hands-on practice',
      image: Assets.image.intro3.path,
    ),
  ];

  List<Widget> generateListCustomTabs() {
    return List.generate(
      3,
      (index) => Container(
        color: AppColor.white,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 100, bottom: 40, left: 80, right: 80),
              child: Image.asset(introItems[index].image),
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text(
                introItems[index].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text(
                introItems[index].content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Indicator
      indicatorConfig: const IndicatorConfig(
        colorIndicator: AppColor.primaryColor,
        sizeIndicator: 8,
        typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
      ),

      // Custom tabs
      listCustomTabs: generateListCustomTabs(),
      backgroundColorAllTabs: Colors.white,
      refFuncGoToTab: (refFunc) {
        goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: const BouncingScrollPhysics(),
      onTabChangeCompleted: onTabChangeCompleted,
    );
  }
}

class IntroSliderModel {
  String title;
  String content;
  String image;

  IntroSliderModel({
    required this.title,
    required this.content,
    required this.image,
  });
}
