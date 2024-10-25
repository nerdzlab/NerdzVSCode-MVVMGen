import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/base/base_imports.dart';

final class AppTextThemeExtension
    extends ThemeExtension<AppTextThemeExtension> {
  const AppTextThemeExtension({
    required this.heading1Bold,
    required this.heading1SemiBold,
    required this.heading1Medium,
    required this.heading1Regular,
    required this.heading2Bold,
    required this.heading2SemiBold,
    required this.heading2Medium,
    required this.heading2Regular,
    required this.heading3Bold,
    required this.heading3SemiBold,
    required this.heading3Medium,
    required this.heading3Regular,
    required this.heading4Bold,
    required this.heading4SemiBold,
    required this.heading4Medium,
    required this.heading4Regular,
    required this.subHeading1Bold,
    required this.subHeading1SemiBold,
    required this.subHeading1Medium,
    required this.subHeading1Regular,
    required this.subHeading2Bold,
    required this.subHeading2SemiBold,
    required this.subHeading2Medium,
    required this.subHeading2Regular,
    required this.body1Bold,
    required this.body1SemiBold,
    required this.body1Medium,
    required this.body1Regular,
    required this.body2Bold,
    required this.body2SemiBold,
    required this.body2Medium,
    required this.body2Regular,
    required this.captionBold,
    required this.captionSemiBold,
    required this.captionMedium,
    required this.captionRegular,
  });

  final TextStyle heading1Bold;
  final TextStyle heading1SemiBold;
  final TextStyle heading1Medium;
  final TextStyle heading1Regular;
  final TextStyle heading2Bold;
  final TextStyle heading2SemiBold;
  final TextStyle heading2Medium;
  final TextStyle heading2Regular;
  final TextStyle heading3Bold;
  final TextStyle heading3SemiBold;
  final TextStyle heading3Medium;
  final TextStyle heading3Regular;
  final TextStyle heading4Bold;
  final TextStyle heading4SemiBold;
  final TextStyle heading4Medium;
  final TextStyle heading4Regular;
  final TextStyle subHeading1Bold;
  final TextStyle subHeading1SemiBold;
  final TextStyle subHeading1Medium;
  final TextStyle subHeading1Regular;
  final TextStyle subHeading2Bold;
  final TextStyle subHeading2SemiBold;
  final TextStyle subHeading2Medium;
  final TextStyle subHeading2Regular;
  final TextStyle body1Bold;
  final TextStyle body1SemiBold;
  final TextStyle body1Medium;
  final TextStyle body1Regular;
  final TextStyle body2Bold;
  final TextStyle body2SemiBold;
  final TextStyle body2Medium;
  final TextStyle body2Regular;
  final TextStyle captionBold;
  final TextStyle captionSemiBold;
  final TextStyle captionMedium;
  final TextStyle captionRegular;

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? heading1Bold,
    TextStyle? heading1SemiBold,
    TextStyle? heading1Medium,
    TextStyle? heading1Regular,
    TextStyle? heading2Bold,
    TextStyle? heading2SemiBold,
    TextStyle? heading2Medium,
    TextStyle? heading2Regular,
    TextStyle? heading3Bold,
    TextStyle? heading3SemiBold,
    TextStyle? heading3Medium,
    TextStyle? heading3Regular,
    TextStyle? heading4Bold,
    TextStyle? heading4SemiBold,
    TextStyle? heading4Medium,
    TextStyle? heading4Regular,
    TextStyle? subHeading1Bold,
    TextStyle? subHeading1SemiBold,
    TextStyle? subHeading1Medium,
    TextStyle? subHeading1Regular,
    TextStyle? subHeading2Bold,
    TextStyle? subHeading2SemiBold,
    TextStyle? subHeading2Medium,
    TextStyle? subHeading2Regular,
    TextStyle? body1Bold,
    TextStyle? body1SemiBold,
    TextStyle? body1Medium,
    TextStyle? body1Regular,
    TextStyle? body2Bold,
    TextStyle? body2SemiBold,
    TextStyle? body2Medium,
    TextStyle? body2Regular,
    TextStyle? captionBold,
    TextStyle? captionSemiBold,
    TextStyle? captionMedium,
    TextStyle? captionRegular,
  }) {
    return AppTextThemeExtension(
      heading1Bold: heading1Bold ?? this.heading1Bold,
      heading1SemiBold: heading1SemiBold ?? this.heading1SemiBold,
      heading1Medium: heading1Medium ?? this.heading1Medium,
      heading1Regular: heading1Regular ?? this.heading1Regular,
      heading2Bold: heading2Bold ?? this.heading2Bold,
      heading2SemiBold: heading2SemiBold ?? this.heading2SemiBold,
      heading2Medium: heading2Medium ?? this.heading2Medium,
      heading2Regular: heading2Regular ?? this.heading2Regular,
      heading3Bold: heading3Bold ?? this.heading3Bold,
      heading3SemiBold: heading3SemiBold ?? this.heading3SemiBold,
      heading3Medium: heading3Medium ?? this.heading3Medium,
      heading3Regular: heading3Regular ?? this.heading3Regular,
      heading4Bold: heading4Bold ?? this.heading4Bold,
      heading4SemiBold: heading4SemiBold ?? this.heading4SemiBold,
      heading4Medium: heading4Medium ?? this.heading4Medium,
      heading4Regular: heading4Regular ?? this.heading4Regular,
      subHeading1Bold: subHeading1Bold ?? this.subHeading1Bold,
      subHeading1SemiBold: subHeading1SemiBold ?? this.subHeading1SemiBold,
      subHeading1Medium: subHeading1Medium ?? this.subHeading1Medium,
      subHeading1Regular: subHeading1Regular ?? this.subHeading1Regular,
      subHeading2Bold: subHeading2Bold ?? this.subHeading2Bold,
      subHeading2SemiBold: subHeading2SemiBold ?? this.subHeading2SemiBold,
      subHeading2Medium: subHeading2Medium ?? this.subHeading2Medium,
      subHeading2Regular: subHeading2Regular ?? this.subHeading2Regular,
      body1Bold: body1Bold ?? this.body1Bold,
      body1SemiBold: body1SemiBold ?? this.body1SemiBold,
      body1Medium: body1Medium ?? this.body1Medium,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Bold: body2Bold ?? this.body2Bold,
      body2SemiBold: body2SemiBold ?? this.body2SemiBold,
      body2Medium: body2Medium ?? this.body2Medium,
      body2Regular: body2Regular ?? this.body2Regular,
      captionBold: captionBold ?? this.captionBold,
      captionSemiBold: captionSemiBold ?? this.captionSemiBold,
      captionMedium: captionMedium ?? this.captionMedium,
      captionRegular: captionRegular ?? this.captionRegular,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
    covariant ThemeExtension<AppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTextThemeExtension) {
      return this;
    }

    return AppTextThemeExtension(
      heading1Bold: TextStyle.lerp(heading1Bold, other.heading1Bold, t)!,
      heading1SemiBold:
          TextStyle.lerp(heading1SemiBold, other.heading1SemiBold, t)!,
      heading1Medium: TextStyle.lerp(heading1Medium, other.heading1Medium, t)!,
      heading1Regular:
          TextStyle.lerp(heading1Regular, other.heading1Regular, t)!,
      heading2Bold: TextStyle.lerp(heading2Bold, other.heading2Bold, t)!,
      heading2SemiBold:
          TextStyle.lerp(heading2SemiBold, other.heading2SemiBold, t)!,
      heading2Medium: TextStyle.lerp(heading2Medium, other.heading2Medium, t)!,
      heading2Regular:
          TextStyle.lerp(heading2Regular, other.heading2Regular, t)!,
      heading3Bold: TextStyle.lerp(heading3Bold, other.heading3Bold, t)!,
      heading3SemiBold:
          TextStyle.lerp(heading3SemiBold, other.heading3SemiBold, t)!,
      heading3Medium: TextStyle.lerp(heading3Medium, other.heading3Medium, t)!,
      heading3Regular:
          TextStyle.lerp(heading3Regular, other.heading3Regular, t)!,
      heading4Bold: TextStyle.lerp(heading4Bold, other.heading4Bold, t)!,
      heading4SemiBold:
          TextStyle.lerp(heading4SemiBold, other.heading4SemiBold, t)!,
      heading4Medium: TextStyle.lerp(heading4Medium, other.heading4Medium, t)!,
      heading4Regular:
          TextStyle.lerp(heading4Regular, other.heading4Regular, t)!,
      subHeading1Bold:
          TextStyle.lerp(subHeading1Bold, other.subHeading1Bold, t)!,
      subHeading1SemiBold:
          TextStyle.lerp(subHeading1SemiBold, other.subHeading1SemiBold, t)!,
      subHeading1Medium:
          TextStyle.lerp(subHeading1Medium, other.subHeading1Medium, t)!,
      subHeading1Regular:
          TextStyle.lerp(subHeading1Regular, other.subHeading1Regular, t)!,
      subHeading2Bold:
          TextStyle.lerp(subHeading2Bold, other.subHeading2Bold, t)!,
      subHeading2SemiBold:
          TextStyle.lerp(subHeading2SemiBold, other.subHeading2SemiBold, t)!,
      subHeading2Medium:
          TextStyle.lerp(subHeading2Medium, other.subHeading2Medium, t)!,
      subHeading2Regular:
          TextStyle.lerp(subHeading2Regular, other.subHeading2Regular, t)!,
      body1Bold: TextStyle.lerp(body1Bold, other.body1Bold, t)!,
      body1SemiBold: TextStyle.lerp(body1SemiBold, other.body1SemiBold, t)!,
      body1Medium: TextStyle.lerp(body1Medium, other.body1Medium, t)!,
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      body2Bold: TextStyle.lerp(body2Bold, other.body2Bold, t)!,
      body2SemiBold: TextStyle.lerp(body2SemiBold, other.body2SemiBold, t)!,
      body2Medium: TextStyle.lerp(body2Medium, other.body2Medium, t)!,
      body2Regular: TextStyle.lerp(body2Regular, other.body2Regular, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      captionSemiBold:
          TextStyle.lerp(captionSemiBold, other.captionSemiBold, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
    );
  }
}
