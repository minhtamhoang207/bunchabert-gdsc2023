import 'package:magic_sign/data/data_source/remote/news_service.dart';
import 'package:magic_sign/domain/repositories/news_repository.dart';

import '../models/news.dart';

class NewsRepoImpl implements NewsRepository {

  NewsRepoImpl({required this.newsService});
  NewsService newsService;

  @override
  Future<News> getListNews({required String topic}) async  {
    return await newsService.getListNews(topic);
  }
}