import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_to_sign.freezed.dart';
part 'image_to_sign.g.dart';

@freezed
class ImageToSign with _$ImageToSign {
  factory ImageToSign({String? text}) = _ImageToSign;

  factory ImageToSign.fromJson(Map<String, dynamic> json) =>
      _$ImageToSignFromJson(json);
}
