import 'package:dio/dio.dart' hide Headers;
import 'package:magic_sign/core/utils/constants.dart';
import 'package:magic_sign/data/models/course.dart';
import 'package:retrofit/http.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  @GET('/courses')
  Future<List<Course>> getCourses();

}