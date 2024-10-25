import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/base/base_imports.dart';

final class AppColorsThemeExtension
    extends ThemeExtension<AppColorsThemeExtension> {
  AppColorsThemeExtension({
    required this.background,
    required this.blue,
    required this.e500,
    required this.green,
    required this.i500,
    required this.n0,
    required this.n100,
    required this.n1000,
    required this.n200,
    required this.n25,
    required this.n300,
    required this.n400,
    required this.n50,
    required this.n500,
    required this.n700,
    required this.p100,
    required this.p200,
    required this.p300,
    required this.p400,
    required this.p500,
    required this.p700,
    required this.pink,
    required this.purple,
    required this.s100,
    required this.s200,
    required this.s300,
    required this.s400,
    required this.s500,
    required this.s600,
    required this.sc500,
    required this.w500,
    required this.transparent,
  });

  final Color background;
  final Color blue;
  final Color e500;
  final Color green;
  final Color i500;
  final Color n0;
  final Color n100;
  final Color n1000;
  final Color n200;
  final Color n25;
  final Color n300;
  final Color n400;
  final Color n50;
  final Color n500;
  final Color n700;
  final Color p100;
  final Color p200;
  final Color p300;
  final Color p400;
  final Color p500;
  final Color p700;
  final Color pink;
  final Color purple;
  final Color s100;
  final Color s200;
  final Color s300;
  final Color s400;
  final Color s500;
  final Color s600;
  final Color sc500;
  final Color w500;
  final Color transparent;

  @override
  ThemeExtension<AppColorsThemeExtension> copyWith({
    Color? background,
    Color? blue,
    Color? e500,
    Color? green,
    Color? i500,
    Color? n0,
    Color? n100,
    Color? n1000,
    Color? n200,
    Color? n25,
    Color? n300,
    Color? n400,
    Color? n50,
    Color? n500,
    Color? n700,
    Color? p100,
    Color? p200,
    Color? p300,
    Color? p400,
    Color? p500,
    Color? p700,
    Color? pink,
    Color? purple,
    Color? s100,
    Color? s200,
    Color? s300,
    Color? s400,
    Color? s500,
    Color? s600,
    Color? sc500,
    Color? w500,
    Color? transparent,
  }) {
    return AppColorsThemeExtension(
      background: background ?? this.background,
      blue: blue ?? this.blue,
      e500: e500 ?? this.e500,
      green: green ?? this.green,
      i500: i500 ?? this.i500,
      n0: n0 ?? this.n0,
      n100: n100 ?? this.n100,
      n1000: n1000 ?? this.n1000,
      n200: n200 ?? this.n200,
      n25: n25 ?? this.n25,
      n300: n300 ?? this.n300,
      n400: n400 ?? this.n400,
      n50: n50 ?? this.n50,
      n500: n500 ?? this.n500,
      n700: n700 ?? this.n700,
      p100: p100 ?? this.p100,
      p200: p200 ?? this.p200,
      p300: p300 ?? this.p300,
      p400: p400 ?? this.p400,
      p500: p500 ?? this.p500,
      p700: p700 ?? this.p700,
      pink: pink ?? this.pink,
      purple: purple ?? this.purple,
      s100: s100 ?? this.s100,
      s200: s200 ?? this.s200,
      s300: s300 ?? this.s300,
      s400: s400 ?? this.s400,
      s500: s500 ?? this.s500,
      s600: s600 ?? this.s600,
      sc500: sc500 ?? this.sc500,
      w500: w500 ?? this.w500,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<AppColorsThemeExtension> lerp(
    covariant ThemeExtension<AppColorsThemeExtension>? other,
    double t,
  ) {
    if (other is! AppColorsThemeExtension) {
      return this;
    }

    return AppColorsThemeExtension(
      background: Color.lerp(background, other.background, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      e500: Color.lerp(e500, other.e500, t)!,
      green: Color.lerp(green, other.green, t)!,
      i500: Color.lerp(i500, other.i500, t)!,
      n0: Color.lerp(n0, other.n0, t)!,
      n100: Color.lerp(n100, other.n100, t)!,
      n1000: Color.lerp(n1000, other.n1000, t)!,
      n200: Color.lerp(n200, other.n200, t)!,
      n25: Color.lerp(n25, other.n25, t)!,
      n300: Color.lerp(n300, other.n300, t)!,
      n400: Color.lerp(n400, other.n400, t)!,
      n50: Color.lerp(n50, other.n50, t)!,
      n500: Color.lerp(n500, other.n500, t)!,
      n700: Color.lerp(n700, other.n700, t)!,
      p100: Color.lerp(p100, other.p100, t)!,
      p200: Color.lerp(p200, other.p200, t)!,
      p300: Color.lerp(p300, other.p300, t)!,
      p400: Color.lerp(p400, other.p400, t)!,
      p500: Color.lerp(p500, other.p500, t)!,
      p700: Color.lerp(p700, other.p700, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      s100: Color.lerp(s100, other.s100, t)!,
      s200: Color.lerp(s200, other.s200, t)!,
      s300: Color.lerp(s300, other.s300, t)!,
      s400: Color.lerp(s400, other.s400, t)!,
      s500: Color.lerp(s500, other.s500, t)!,
      s600: Color.lerp(s600, other.s600, t)!,
      sc500: Color.lerp(sc500, other.sc500, t)!,
      w500: Color.lerp(w500, other.w500, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }
}
