// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/account_icon
  $AssetsIconsAccountIconGen get accountIcon =>
      const $AssetsIconsAccountIconGen();

  /// File path: assets/icons/bell.svg
  String get bell => 'assets/icons/bell.svg';

  /// Directory path: assets/icons/bottom_bar
  $AssetsIconsBottomBarGen get bottomBar => const $AssetsIconsBottomBarGen();

  /// File path: assets/icons/clock.svg
  String get clock => 'assets/icons/clock.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// File path: assets/icons/lacation.svg
  String get lacation => 'assets/icons/lacation.svg';

  /// File path: assets/icons/left.svg
  String get left => 'assets/icons/left.svg';

  /// File path: assets/icons/like.svg
  String get like => 'assets/icons/like.svg';

  /// File path: assets/icons/more.svg
  String get more => 'assets/icons/more.svg';

  /// File path: assets/icons/more_2.svg
  String get more2 => 'assets/icons/more_2.svg';

  /// File path: assets/icons/plus.svg
  String get plus => 'assets/icons/plus.svg';

  /// File path: assets/icons/promocode.svg
  String get promocode => 'assets/icons/promocode.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// File path: assets/icons/star_full.svg
  String get starFull => 'assets/icons/star_full.svg';

  /// File path: assets/icons/visit.svg
  String get visit => 'assets/icons/visit.svg';

  /// File path: assets/icons/x.svg
  String get x => 'assets/icons/x.svg';

  /// List of all assets
  List<String> get values => [
    bell,
    clock,
    facebook,
    google,
    lacation,
    left,
    like,
    more,
    more2,
    plus,
    promocode,
    search,
    star,
    starFull,
    visit,
    x,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/Logo.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng_ => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/men.png
  AssetGenImage get men => const AssetGenImage('assets/images/men.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoPng, logoPng_, men];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/disconnect.json
  String get disconnect => 'assets/lotties/disconnect.json';

  /// File path: assets/lotties/food.json
  String get food => 'assets/lotties/food.json';

  /// List of all assets
  List<String> get values => [disconnect, food];
}

class $AssetsMockGen {
  const $AssetsMockGen();

  /// File path: assets/mock/mock_data.json
  String get mockData => 'assets/mock/mock_data.json';

  /// List of all assets
  List<String> get values => [mockData];
}

class $AssetsIconsAccountIconGen {
  const $AssetsIconsAccountIconGen();

  /// File path: assets/icons/account_icon/info.svg
  String get info => 'assets/icons/account_icon/info.svg';

  /// File path: assets/icons/account_icon/lock.svg
  String get lock => 'assets/icons/account_icon/lock.svg';

  /// File path: assets/icons/account_icon/out.svg
  String get out => 'assets/icons/account_icon/out.svg';

  /// File path: assets/icons/account_icon/person.svg
  String get person => 'assets/icons/account_icon/person.svg';

  /// File path: assets/icons/account_icon/setting.svg
  String get setting => 'assets/icons/account_icon/setting.svg';

  /// File path: assets/icons/account_icon/world.svg
  String get world => 'assets/icons/account_icon/world.svg';

  /// List of all assets
  List<String> get values => [info, lock, out, person, setting, world];
}

class $AssetsIconsBottomBarGen {
  const $AssetsIconsBottomBarGen();

  /// File path: assets/icons/bottom_bar/bar_like.svg
  String get barLike => 'assets/icons/bottom_bar/bar_like.svg';

  /// File path: assets/icons/bottom_bar/bar_more.svg
  String get barMore => 'assets/icons/bottom_bar/bar_more.svg';

  /// File path: assets/icons/bottom_bar/home.svg
  String get home => 'assets/icons/bottom_bar/home.svg';

  /// File path: assets/icons/bottom_bar/user.svg
  String get user => 'assets/icons/bottom_bar/user.svg';

  /// List of all assets
  List<String> get values => [barLike, barMore, home, user];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsMockGen mock = $AssetsMockGen();
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
