import 'dart:io';

import 'package:magic_sign/data/models/image_to_sign.dart';

abstract class SignLanguageRepository {
  Future<List<int>> getSignVideo({required String txt});
  Future<ImageToSign> getSignVideoFromImg({required File fileUpload});
  Future<ImageToSign> sign2text({required File fileUpload});
}
