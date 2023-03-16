// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  List<Lesson>? get lessons => throw _privateConstructorUsedError;
  List<Quiz>? get quiz => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? title,
      String? thumbnail,
      List<Lesson>? lessons,
      List<Quiz>? quiz});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res> implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  final Course _value;
  // ignore: unused_field
  final $Res Function(Course) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? thumbnail = freezed,
    Object? lessons = freezed,
    Object? quiz = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      lessons: lessons == freezed
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as List<Quiz>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? title,
      String? thumbnail,
      List<Lesson>? lessons,
      List<Quiz>? quiz});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res> extends _$CourseCopyWithImpl<$Res>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, (v) => _then(v as _$_Course));

  @override
  _$_Course get _value => super._value as _$_Course;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? thumbnail = freezed,
    Object? lessons = freezed,
    Object? quiz = freezed,
  }) {
    return _then(_$_Course(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      lessons: lessons == freezed
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      quiz: quiz == freezed
          ? _value._quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as List<Quiz>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course implements _Course {
  _$_Course(
      {this.id,
      this.title,
      this.thumbnail,
      final List<Lesson>? lessons,
      final List<Quiz>? quiz})
      : _lessons = lessons,
        _quiz = quiz;

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? thumbnail;
  final List<Lesson>? _lessons;
  @override
  List<Lesson>? get lessons {
    final value = _lessons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Quiz>? _quiz;
  @override
  List<Quiz>? get quiz {
    final value = _quiz;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Course(id: $id, title: $title, thumbnail: $thumbnail, lessons: $lessons, quiz: $quiz)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            const DeepCollectionEquality().equals(other._quiz, _quiz));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(_lessons),
      const DeepCollectionEquality().hash(_quiz));

  @JsonKey(ignore: true)
  @override
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(this);
  }
}

abstract class _Course implements Course {
  factory _Course(
      {final String? id,
      final String? title,
      final String? thumbnail,
      final List<Lesson>? lessons,
      final List<Quiz>? quiz}) = _$_Course;

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get thumbnail;
  @override
  List<Lesson>? get lessons;
  @override
  List<Quiz>? get quiz;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  String? get word => throw _privateConstructorUsedError;
  String? get meaning => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res>;
  $Res call({String? word, String? meaning, String? attachment, String? id});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res> implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  final Lesson _value;
  // ignore: unused_field
  final $Res Function(Lesson) _then;

  @override
  $Res call({
    Object? word = freezed,
    Object? meaning = freezed,
    Object? attachment = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: meaning == freezed
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$_LessonCopyWith(_$_Lesson value, $Res Function(_$_Lesson) then) =
      __$$_LessonCopyWithImpl<$Res>;
  @override
  $Res call({String? word, String? meaning, String? attachment, String? id});
}

/// @nodoc
class __$$_LessonCopyWithImpl<$Res> extends _$LessonCopyWithImpl<$Res>
    implements _$$_LessonCopyWith<$Res> {
  __$$_LessonCopyWithImpl(_$_Lesson _value, $Res Function(_$_Lesson) _then)
      : super(_value, (v) => _then(v as _$_Lesson));

  @override
  _$_Lesson get _value => super._value as _$_Lesson;

  @override
  $Res call({
    Object? word = freezed,
    Object? meaning = freezed,
    Object? attachment = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Lesson(
      word: word == freezed
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      meaning: meaning == freezed
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lesson implements _Lesson {
  _$_Lesson({this.word, this.meaning, this.attachment, this.id});

  factory _$_Lesson.fromJson(Map<String, dynamic> json) =>
      _$$_LessonFromJson(json);

  @override
  final String? word;
  @override
  final String? meaning;
  @override
  final String? attachment;
  @override
  final String? id;

  @override
  String toString() {
    return 'Lesson(word: $word, meaning: $meaning, attachment: $attachment, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lesson &&
            const DeepCollectionEquality().equals(other.word, word) &&
            const DeepCollectionEquality().equals(other.meaning, meaning) &&
            const DeepCollectionEquality()
                .equals(other.attachment, attachment) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(word),
      const DeepCollectionEquality().hash(meaning),
      const DeepCollectionEquality().hash(attachment),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_LessonCopyWith<_$_Lesson> get copyWith =>
      __$$_LessonCopyWithImpl<_$_Lesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonToJson(this);
  }
}

abstract class _Lesson implements Lesson {
  factory _Lesson(
      {final String? word,
      final String? meaning,
      final String? attachment,
      final String? id}) = _$_Lesson;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$_Lesson.fromJson;

  @override
  String? get word;
  @override
  String? get meaning;
  @override
  String? get attachment;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_LessonCopyWith<_$_Lesson> get copyWith =>
      throw _privateConstructorUsedError;
}

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  List<Answer>? get answers => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res>;
  $Res call({List<Answer>? answers, String? attachment, String? id});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  final Quiz _value;
  // ignore: unused_field
  final $Res Function(Quiz) _then;

  @override
  $Res call({
    Object? answers = freezed,
    Object? attachment = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  $Res call({List<Answer>? answers, String? attachment, String? id});
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, (v) => _then(v as _$_Quiz));

  @override
  _$_Quiz get _value => super._value as _$_Quiz;

  @override
  $Res call({
    Object? answers = freezed,
    Object? attachment = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Quiz(
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz implements _Quiz {
  const _$_Quiz({final List<Answer>? answers, this.attachment, this.id})
      : _answers = answers;

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  final List<Answer>? _answers;
  @override
  List<Answer>? get answers {
    final value = _answers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? attachment;
  @override
  final String? id;

  @override
  String toString() {
    return 'Quiz(answers: $answers, attachment: $attachment, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quiz &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other.attachment, attachment) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(attachment),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizToJson(this);
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {final List<Answer>? answers,
      final String? attachment,
      final String? id}) = _$_Quiz;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  List<Answer>? get answers;
  @override
  String? get attachment;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call({String? content, @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  $Res call({String? content, @JsonKey(name: 'is_correct') bool? isCorrect});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, (v) => _then(v as _$_Answer));

  @override
  _$_Answer get _value => super._value as _$_Answer;

  @override
  $Res call({
    Object? content = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_$_Answer(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Answer implements _Answer {
  const _$_Answer({this.content, @JsonKey(name: 'is_correct') this.isCorrect});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  final String? content;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;

  @override
  String toString() {
    return 'Answer(content: $content, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.isCorrect, isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(isCorrect));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(this);
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {final String? content,
      @JsonKey(name: 'is_correct') final bool? isCorrect}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String? get content;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
