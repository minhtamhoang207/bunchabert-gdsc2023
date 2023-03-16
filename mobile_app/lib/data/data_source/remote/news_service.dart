import 'package:dio/dio.dart';
import 'package:magic_sign/core/utils/constants.dart';

import '../../models/news.dart';

class NewsService {
  NewsService(this.dio);
  Dio dio;

  Future<News> getListNews(String topic) async {
    final response = await dio.get(
        '$kNewsURL/news',
        queryParameters: {'q': topic}
    );
    return News.fromJson(response.data[0]);
  }
}