import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart' show LucideIcons;
import '../utils/responsive.dart';

// ==========================
// 🟢 TAP AREA WIDGET
// ==========================
class TapArea extends StatefulWidget {
  final double clickValue;
  final VoidCallback onTap;
  
  // Upgrade props
  final bool canUpgrade;
  final double upgradeCost;
  final VoidCallback? onUpgrade;

  const TapArea({
    super.key,
    required this.clickValue,
    required this.onTap,
    this.canUpgrade = false,
    this.upgradeCost = 0.0,
    this.onUpgrade,
  });

  @override
  State<TapArea> createState() => _TapAreaState();
}

class _TapAreaState extends State<TapArea> {
  double scale = 1.0;

  void _handleTapDown(TapDownDetails _) {
    setState(() {
      scale = 0.94;
    });
    widget.onTap();
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() {
      scale = 1.0;
    });
  }

  void _handleTapCancel() {
    setState(() {
      scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final r = R(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Upgrade Button (visible if can upgrade)
        if (widget.canUpgrade && widget.onUpgrade != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: widget.onUpgrade,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                "Upgrade for \$${widget.upgradeCost.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

        // ==========================
        // 🎯 CLICKABLE AREA (ENTIRE SPACE)
        // ==========================
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: AnimatedScale(
              scale: scale,
              duration: const Duration(milliseconds: 80),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hand Icon
                    Icon(
                      LucideIcons.hand,
                      size: r.wClamp(0.18, min: 56, max: 92),
                      color: Colors.black.withValues(alpha: 0.45),
                    ),

                    SizedBox(height: r.hClamp(0.02, min: 10, max: 22)),

                    Text(
                      "Click to earn \$${widget.clickValue.toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: r.wClamp(0.045, min: 14, max: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
