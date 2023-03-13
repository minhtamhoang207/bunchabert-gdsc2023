import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../data/models/news.dart';
import '../../../../domain/usecases/news_usecase.dart';
import '../../../../gen/assets.gen.dart';

class HomeController extends GetxController with StateMixin<HomeController>{

  HomeController({required this.newsUseCases});
  NewsUseCases newsUseCases;

  Rx<List<Article>> news = Rx<List<Article>>([]);
  final GoogleSignIn _googleSignIn = Get.find<GoogleSignIn>();
  late final GoogleSignInAccount? currentUser;
  final List<String> listFeature = [
    'Translate text/speech into sign language',
    'Translate text in image into sign language',
    'Learning sign language',
    'News'
  ];

  final List<String> listFeatureImg = [
    Assets.image.imgSignLanguage.path,
    Assets.image.imgImageToSign.path,
    Assets.image.imgLearning.path,
    Assets.image.imgNews.path,
  ];

  @override
  void onInit() async {
    Future.sync(() => {
      currentUser = _googleSignIn.currentUser,
      getListNews()
    });
    super.onInit();
  }

  getListNews() async {
    try {
      change(this, status: RxStatus.loading());
      final response =  await newsUseCases.getListNews(topic: 'Technology');
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
