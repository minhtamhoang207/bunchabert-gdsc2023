import 'package:auto_size_text/auto_size_text.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFF4C6ED7),
            title: const Text('Quiz'),
          ),
          body: const Quiz()),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: PageView.builder(
        itemCount: controller.listQuiz.length,
        itemBuilder: (context, index) {
          return MemoryPlayerPage(index: index);
        },
        scrollDirection: Axis.horizontal,
        controller: controller.pageController,
        onPageChanged: (int num) {},
      ),
    );
  }
}

class MemoryPlayerPage extends StatefulWidget {
  final int index;
  const MemoryPlayerPage({Key? key, required this.index}) : super(key: key);

  @override
  _MemoryPlayerPageState createState() => _MemoryPlayerPageState();
}

class _MemoryPlayerPageState extends State<MemoryPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  final controller = Get.find<QuizController>();

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
        controller.listQuiz[widget.index].attachment ?? '');
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: controller.listQuiz[widget.index].answers?.length ?? 0,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 16 / 9),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        controller.listAnswer.value[widget.index] = PickedAnswer(
                            quiz: controller.listQuiz[widget.index],
                            correct: controller.listQuiz[widget.index].answers?[index].isCorrect??false,
                            pickedAnswer: index
                        );
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            color: index == controller.listAnswer.value[widget.index].pickedAnswer
                                ? const Color(0xFF4C6ED7)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all()),
                        child: Center(
                            child: SingleChildScrollView(
                              child: AutoSizeText(
                                controller.listQuiz[widget.index].answers?[index].content ?? '',
                                maxLines: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: index == controller.listAnswer.value[widget.index].pickedAnswer?
                                        Colors.white:
                                        Colors.black
                                ),
                              ),
                            )
                        )
                    )
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          widget.index == controller.listQuiz.length - 1?
          _showDialog(controller.listQuiz.length, controller.getCorrectAnswer()):
          controller.pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: const Color(0xFF4C6ED7),
          ),
          child: Text(
            widget.index == controller.listQuiz.length - 1?
            'Complete':'Continue',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  _showDialog(int total, int correct){
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.9), // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(Assets.image.icDone,
                width: Get.width - 100,
                height: Get.width - 100,
              ),
              Text(
                '$correct/$total',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF4C6ED7), fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Gap(20),
              const Text(
                'You have complete the quiz!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF4C6ED7), fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Gap(40),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: const Color(0xFF4C6ED7),
                  ),
                  child: const Center(
                    child: Text(
                      'Go back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) => Get.back());
  }
}
