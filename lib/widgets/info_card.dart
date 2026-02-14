import 'package:flutter/material.dart';

// ==========================
// 🃏 INFO CARD WIDGET
// ==========================
class InfoCard extends StatelessWidget {
  final double height;
  final double borderRadius;
  final Color color;
  final Widget? child;

  const InfoCard({
    super.key,
    required this.height,
    required this.borderRadius,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
