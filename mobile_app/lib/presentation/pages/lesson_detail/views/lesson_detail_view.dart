import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/lesson_detail_controller.dart';

class LessonDetailView extends GetView<LessonDetailController> {
  const LessonDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF4C6ED7),
            title: Text(controller.lesson.word??''),
          ),
          body: const MemoryPlayerPage()),
    );
  }
}

class MemoryPlayerPage extends StatefulWidget {
  const MemoryPlayerPage({Key? key}) : super(key: key);

  @override
  _MemoryPlayerPageState createState() => _MemoryPlayerPageState();
}

class _MemoryPlayerPageState extends State<MemoryPlayerPage> {
  late BetterPlayerController _betterPlayerController;
  final controller = Get.find<LessonDetailController>();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSource();
    _betterPlayerController.play();
    super.initState();
  }

  void _setupDataSource() async {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource.network(
      controller.lesson.attachment??''
    );
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
          const Gap(30),
          IntrinsicHeight(
            child: Row(
              children: [
                const Gap(20),
                const VerticalDivider(color: Color(0xFF4C6ED7), thickness: 5),
                const Gap(10),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            controller.lesson.word??'',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                    )),
                const Gap(15),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                controller.lesson.meaning??'',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: ()=> Get.back(),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: const Color(0xFF4C6ED7),
          ),
          child: const Text(
            'Go back',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),

          ),
        ),
      ),
    );
  }
}
