// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_to_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageToSign _$ImageToSignFromJson(Map<String, dynamic> json) {
  return _ImageToSign.fromJson(json);
}

/// @nodoc
mixin _$ImageToSign {
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageToSignCopyWith<ImageToSign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageToSignCopyWith<$Res> {
  factory $ImageToSignCopyWith(
          ImageToSign value, $Res Function(ImageToSign) then) =
      _$ImageToSignCopyWithImpl<$Res, ImageToSign>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class _$ImageToSignCopyWithImpl<$Res, $Val extends ImageToSign>
    implements $ImageToSignCopyWith<$Res> {
  _$ImageToSignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageToSignCopyWith<$Res>
    implements $ImageToSignCopyWith<$Res> {
  factory _$$_ImageToSignCopyWith(
          _$_ImageToSign value, $Res Function(_$_ImageToSign) then) =
      __$$_ImageToSignCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$_ImageToSignCopyWithImpl<$Res>
    extends _$ImageToSignCopyWithImpl<$Res, _$_ImageToSign>
    implements _$$_ImageToSignCopyWith<$Res> {
  __$$_ImageToSignCopyWithImpl(
      _$_ImageToSign _value, $Res Function(_$_ImageToSign) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_ImageToSign(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageToSign implements _ImageToSign {
  _$_ImageToSign({this.text});

  factory _$_ImageToSign.fromJson(Map<String, dynamic> json) =>
      _$$_ImageToSignFromJson(json);

  @override
  final String? text;

  @override
  String toString() {
    return 'ImageToSign(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageToSign &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageToSignCopyWith<_$_ImageToSign> get copyWith =>
      __$$_ImageToSignCopyWithImpl<_$_ImageToSign>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToSignToJson(
      this,
    );
  }
}

abstract class _ImageToSign implements ImageToSign {
  factory _ImageToSign({final String? text}) = _$_ImageToSign;

  factory _ImageToSign.fromJson(Map<String, dynamic> json) =
      _$_ImageToSign.fromJson;

  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_ImageToSignCopyWith<_$_ImageToSign> get copyWith =>
      throw _privateConstructorUsedError;
}
