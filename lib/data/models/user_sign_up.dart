import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sign_up.freezed.dart';
part 'user_sign_up.g.dart';

@freezed
class UserAuth with _$UserAuth {
  factory UserAuth({
    String? email,
    required String password,
    required String username,
  }) = _UserAuth;

  factory UserAuth.fromJson(Map<String, dynamic> json) => _$UserAuthFromJson(json);
}