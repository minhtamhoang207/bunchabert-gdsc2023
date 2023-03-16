import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/course.dart';

class QuizController extends GetxController {

  PageController pageController = PageController();
  final List<Quiz> listQuiz = Get.arguments??[];
  final Rx<List<PickedAnswer>> listAnswer = Rx<List<PickedAnswer>>([]);

  @override
  void onInit() {
    for(var item in listQuiz){
      listAnswer.value.add(
        PickedAnswer(quiz: item, correct: false)
      );
    }
    super.onInit();
  }

  int getCorrectAnswer(){
    int count = 0;
    for(var item in listAnswer.value){
      print(item.toString());
      if(item.correct == true) count += 1;
    }
    return count;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class PickedAnswer {
  Quiz quiz;
  int? pickedAnswer;
  bool correct;

  PickedAnswer({required this.quiz, this.pickedAnswer, required this.correct});

  @override
  String toString() {
    return '$pickedAnswer - $correct';
  }
}