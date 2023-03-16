import 'dart:developer';

import 'package:get/get.dart';
import 'package:magic_sign/data/models/news.dart';
import 'package:magic_sign/domain/usecases/news_usecase.dart';

class ExploreController extends GetxController with StateMixin<ExploreController> {

  ExploreController({required this.newsUseCases});
  NewsUseCases newsUseCases;

  final List<String> topic = ['Healthy', 'Technology', 'Finance', 'Arts', 'Style', 'Food', 'Travel', 'Sports', 'Sciences'];
  RxInt currentTopic = RxInt(0);
  Rx<List<Article>> news = Rx<List<Article>>([]);

  @override
  void onInit() async {
    await getListNews();
    super.onInit();
  }

  chooseTopic(int index) async {
    currentTopic.value = index;
    await getListNews();
  }

  getListNews() async {
    try {
      change(this, status: RxStatus.loading());
      final response =  await newsUseCases.getListNews(topic: topic[currentTopic.value]);
      news.value = response.articles??[];
      change(this, status: RxStatus.success());
    } catch (e){
      log(e.toString());
      change(this, status: RxStatus.error(e.toString()));
    }
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


