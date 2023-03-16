import 'dart:async';

import 'package:magic_sign/domain/repositories/news_repository.dart';

import '../../data/models/news.dart';

class NewsUseCases {
  final NewsRepository newsRepository;

  NewsUseCases({required this.newsRepository});

  FutureOr<News> getListNews({required String topic}) async {
    try {
      final response = await newsRepository.getListNews(topic: topic);
      print(response.runtimeType);
      return response;
    } catch (e){
      rethrow;
    }
  }
}