import 'package:flutter/widgets.dart';

abstract class AppPalette {
  // Red
  static const Color imperialRed = Color(0xFFE54B4B);

  // White
  static const Color seashell = Color(0xFFF7EBE8);

  // Grey
  static const grey = _GreyColors();
}

/// Alternative way to group colors in the palette.
///
/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}
