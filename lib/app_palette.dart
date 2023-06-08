import 'package:flutter/material.dart';

abstract class AppPalette {
  // Red
  static const red = Colors.red;
  static const imperialRed = Color(0xFFE54B4B);

  // White
  static const seashell = Color(0xFFF7EBE8);

  // Grey
  static const grey = _GreyColors();
}

/// Alternative way to group colors in the palette.
/// 
/// The downside is that you won't be able
/// to use them as constructor default values,
/// because they are not constants.
///
/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}
