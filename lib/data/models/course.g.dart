// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as String?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      quiz: (json['quiz'] as List<dynamic>?)
          ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'lessons': instance.lessons,
      'quiz': instance.quiz,
    };

_$_Lesson _$$_LessonFromJson(Map<String, dynamic> json) => _$_Lesson(
      word: json['word'] as String?,
      meaning: json['meaning'] as String?,
      attachment: json['attachment'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'word': instance.word,
      'meaning': instance.meaning,
      'attachment': instance.attachment,
      'id': instance.id,
    };

_$_Quiz _$$_QuizFromJson(Map<String, dynamic> json) => _$_Quiz(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachment: json['attachment'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_QuizToJson(_$_Quiz instance) => <String, dynamic>{
      'answers': instance.answers,
      'attachment': instance.attachment,
      'id': instance.id,
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      content: json['content'] as String?,
      isCorrect: json['is_correct'] as bool?,
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'content': instance.content,
      'is_correct': instance.isCorrect,
    };
