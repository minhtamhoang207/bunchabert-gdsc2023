import 'dart:async';

import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/domain/repositories/auth_repository.dart';
import 'package:magic_sign/domain/repositories/news_repository.dart';

import '../../data/models/course.dart';
import '../../data/models/user_sign_up.dart';
import '../repositories/course_repository.dart';


class CourseUseCase {
  final CourseRepository courseRepository;

  CourseUseCase({required this.courseRepository});

  FutureOr<List<Course>> getCourse() async {
    try {
      final response = await courseRepository.getCourses();
      return response;
    } catch (e){
      rethrow;
    }
  }
}