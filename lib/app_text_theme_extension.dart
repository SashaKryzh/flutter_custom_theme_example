import 'package:flutter/material.dart';

/// `ThemeExtension` for custom text styles example.
///
/// If your goal is to only change text color for light/dark mode, I don't see a big benefit from this extension.
/// For default text style in Text widget, you can set `textTheme.bodyMedium` in `ThemeData` (example: lib/app_theme.dart).
/// And to set text color for specific widget, you can use `style: TextStyle(color: Theme.of(context).appColors.error)` or
/// `style: context.theme.appTextTheme.h1.copyWith(color: context.appColors.primary)`.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    required this.body1,
    required this.h1,
  });

  final TextStyle body1;
  final TextStyle h1;

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? body1,
    TextStyle? h1,
  }) {
    return AppTextTheme(
      body1: body1 ?? this.body1,
      h1: h1 ?? this.h1,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(
    covariant ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme(
      body1: TextStyle.lerp(body1, other.body1, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
    );
  }
}
