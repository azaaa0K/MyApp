import 'package:flutter/material.dart';

// ==========================
// 🔧 RESPONSIVE HELPER
// ==========================
/// A helper class to make the UI responsive across different screen sizes.
/// This class provides methods to clamp values based on screen width and height.
class R {
  final double h;
  final double w;

  R(BuildContext context)
      : h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;

  /// Clamps a value based on the screen height.
  /// [factor] is the percentage of the screen height.
  /// [min] is the minimum value to return.
  /// [max] is the maximum value to return.
  double hClamp(
    double factor, {
    double min = 0,
    double max = double.infinity,
  }) => (h * factor).clamp(min, max);

  /// Clamps a value based on the screen width.
  /// [factor] is the percentage of the screen width.
  /// [min] is the minimum value to return.
  /// [max] is the maximum value to return.
  double wClamp(
    double factor, {
    double min = 0,
    double max = double.infinity,
  }) => (w * factor).clamp(min, max);
}
