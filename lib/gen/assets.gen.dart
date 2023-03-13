/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/ic_done.json
  String get icDone => 'assets/image/ic_done.json';

  /// File path: assets/image/ic_launcher.jpg
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/image/ic_launcher.jpg');

  /// File path: assets/image/ic_sign.png
  AssetGenImage get icSign => const AssetGenImage('assets/image/ic_sign.png');

  /// File path: assets/image/img_feature.png
  AssetGenImage get imgFeature =>
      const AssetGenImage('assets/image/img_feature.png');

  /// File path: assets/image/img_image_to_sign.png
  AssetGenImage get imgImageToSign =>
      const AssetGenImage('assets/image/img_image_to_sign.png');

  /// File path: assets/image/img_learning.png
  AssetGenImage get imgLearning =>
      const AssetGenImage('assets/image/img_learning.png');

  /// File path: assets/image/img_news.png
  AssetGenImage get imgNews => const AssetGenImage('assets/image/img_news.png');

  /// File path: assets/image/img_sign_language.png
  AssetGenImage get imgSignLanguage =>
      const AssetGenImage('assets/image/img_sign_language.png');

  /// File path: assets/image/intro_1.png
  AssetGenImage get intro1 => const AssetGenImage('assets/image/intro_1.png');

  /// File path: assets/image/intro_2.png
  AssetGenImage get intro2 => const AssetGenImage('assets/image/intro_2.png');

  /// File path: assets/image/intro_3.png
  AssetGenImage get intro3 => const AssetGenImage('assets/image/intro_3.png');
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/huawei_logo.svg
  String get huaweiLogo => 'assets/svg/huawei_logo.svg';

  /// File path: assets/svg/ic_camera.svg
  String get icCamera => 'assets/svg/ic_camera.svg';

  /// File path: assets/svg/ic_compass.svg
  String get icCompass => 'assets/svg/ic_compass.svg';

  /// File path: assets/svg/ic_home.svg
  String get icHome => 'assets/svg/ic_home.svg';

  /// File path: assets/svg/ic_news.svg
  String get icNews => 'assets/svg/ic_news.svg';

  /// File path: assets/svg/ic_person.svg
  String get icPerson => 'assets/svg/ic_person.svg';

  /// File path: assets/svg/intro_1.svg
  String get intro1 => 'assets/svg/intro_1.svg';

  /// File path: assets/svg/intro_2.svg
  String get intro2 => 'assets/svg/intro_2.svg';

  /// File path: assets/svg/intro_3.svg
  String get intro3 => 'assets/svg/intro_3.svg';
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
