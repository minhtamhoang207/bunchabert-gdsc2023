import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import '../../learning/controllers/learning_controller.dart';
import '../controllers/dash_board_controller.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(()=>CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: controller.pageIndex.value,
          height: 60.0,
          items: [
            _bottomBarButton(Assets.svg.icHome, 0),
            _bottomBarButton(Assets.svg.icCompass, 1),
            _bottomBarButton(Assets.svg.icCamera, 2),
            _bottomBarButton(Assets.svg.icNews, 3),
            _bottomBarButton(Assets.svg.icPerson, 4)
          ],
          color: const Color(0xFFEEEEEE),
          buttonBackgroundColor: const Color(0xFF326273),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            if(index == 3){
              Get.find<LearningController>().onInit();
              controller.setIndex(index: index);
            } else {
              controller.setIndex(index: index);
            }
          },
          letIndexChange: (index) => true,
        )),
        body: Obx(() => controller.pages[controller.pageIndex.value]));
  }
}

Widget _bottomBarButton(String icon, int index) {
  return Padding(
      padding: const EdgeInsets.all(12),
      child: Obx(() => SvgPicture.asset(icon,
          height: 24,
          width: 24,
          color: Get.find<DashBoardController>().pageIndex.value == index
              ? Colors.white
              : Colors.black)));
}
