
import '../../data/models/news.dart';

abstract class NewsRepository {
  Future<News> getListNews({required String topic});
}