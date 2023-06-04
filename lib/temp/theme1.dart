import 'package:flutter/material.dart';
import 'package:theme_extensions/app_colors_extension.dart';
import 'package:theme_extensions/app_text_theme_extension.dart';

class AppTheme with ChangeNotifier {
  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xffbb86fc),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: const Color(0xff121212),
    onBackground: Colors.white,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
  );
}

/// Define getters for your `ThemeExtension` here.
///
/// Never use `Theme.of(context).extension<MyColors>()!` how they do it in the [official example](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).appColors`.
extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  // AppTextThemeExtension get appTextTheme =>
  //     extension<AppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme.appColors`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
