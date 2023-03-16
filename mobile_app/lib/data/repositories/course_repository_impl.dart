import 'package:magic_sign/data/data_source/remote/course_service.dart';
import 'package:magic_sign/data/models/course.dart';
import 'package:magic_sign/domain/repositories/course_repository.dart';


class CourseRepoImpl implements CourseRepository {

  CourseRepoImpl({required this.courseService});
  CourseService courseService;

  @override
  Future<List<Course>> getCourses() async  {
    final response = await courseService.getCourses();
    return response;
  }
}