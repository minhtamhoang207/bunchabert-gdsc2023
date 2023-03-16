import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/data/models/user_sign_up.dart';

import '../../data/models/course.dart';


abstract class CourseRepository {
  Future<List<Course>> getCourses();
}