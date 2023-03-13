import 'package:dio/dio.dart';

abstract class SignLanguageRepository {
  Future<List<int>> getSignVideo({required String txt});
  Future<List<int>> getSignVideoFromImg({required MultipartFile fileUpload});
}