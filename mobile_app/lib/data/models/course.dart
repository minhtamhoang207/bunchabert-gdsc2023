import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';


@freezed
class Course with _$Course {
  factory Course({
    String? id,
    String? title,
    String? thumbnail,
    List<Lesson>? lessons,
    List<Quiz>? quiz,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class Lesson with _$Lesson {
  factory Lesson({
    String? word,
    String? meaning,
    String? attachment,
    String? id,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    List<Answer>? answers,
    String? attachment,
    String? id,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    String? content,
    @JsonKey(name: 'is_correct')
    bool? isCorrect,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
