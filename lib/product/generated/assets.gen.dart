// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env.dev
  String get aEnv => 'assets/env/.env.dev';

  /// List of all assets
  List<String> get values => [aEnv];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/highlights.png
  AssetGenImage get highlights =>
      const AssetGenImage('assets/png/highlights.png');

  /// File path: assets/png/more_like.png
  AssetGenImage get moreLike => const AssetGenImage('assets/png/more_like.png');

  /// File path: assets/png/more_matching.png
  AssetGenImage get moreMatching =>
      const AssetGenImage('assets/png/more_matching.png');

  /// File path: assets/png/premium_account.png
  AssetGenImage get premiumAccount =>
      const AssetGenImage('assets/png/premium_account.png');

  /// File path: assets/png/sin_flix_logo.png
  AssetGenImage get sinFlixLogo =>
      const AssetGenImage('assets/png/sin_flix_logo.png');

  /// File path: assets/png/sin_flix_splash.png
  AssetGenImage get sinFlixSplash =>
      const AssetGenImage('assets/png/sin_flix_splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    highlights,
    moreLike,
    moreMatching,
    premiumAccount,
    sinFlixLogo,
    sinFlixSplash,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/svg/apple.svg');

  /// File path: assets/svg/diamond.svg
  SvgGenImage get diamond => const SvgGenImage('assets/svg/diamond.svg');

  /// File path: assets/svg/email.svg
  SvgGenImage get email => const SvgGenImage('assets/svg/email.svg');

  /// File path: assets/svg/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/svg/facebook.svg');

  /// File path: assets/svg/favorite_hearth_fill.svg
  SvgGenImage get favoriteHearthFill =>
      const SvgGenImage('assets/svg/favorite_hearth_fill.svg');

  /// File path: assets/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svg/google.svg');

  /// File path: assets/svg/highlights.svg
  SvgGenImage get highlights => const SvgGenImage('assets/svg/highlights.svg');

  /// File path: assets/svg/home_tab.svg
  SvgGenImage get homeTab => const SvgGenImage('assets/svg/home_tab.svg');

  /// File path: assets/svg/more_like.svg
  SvgGenImage get moreLike => const SvgGenImage('assets/svg/more_like.svg');

  /// File path: assets/svg/more_matching.svg
  SvgGenImage get moreMatching =>
      const SvgGenImage('assets/svg/more_matching.svg');

  /// File path: assets/svg/name.svg
  SvgGenImage get name => const SvgGenImage('assets/svg/name.svg');

  /// File path: assets/svg/password.svg
  SvgGenImage get password => const SvgGenImage('assets/svg/password.svg');

  /// File path: assets/svg/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/svg/plus.svg');

  /// File path: assets/svg/premium_account.svg
  SvgGenImage get premiumAccount =>
      const SvgGenImage('assets/svg/premium_account.svg');

  /// File path: assets/svg/profile_tab.svg
  SvgGenImage get profileTab => const SvgGenImage('assets/svg/profile_tab.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    apple,
    diamond,
    email,
    facebook,
    favoriteHearthFill,
    google,
    highlights,
    homeTab,
    moreLike,
    moreMatching,
    name,
    password,
    plus,
    premiumAccount,
    profileTab,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/tr.json
  String get tr => 'assets/translations/tr.json';

  /// List of all assets
  List<String> get values => [en, tr];
}

class Assets {
  const Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
