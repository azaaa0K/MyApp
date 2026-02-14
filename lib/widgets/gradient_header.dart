import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'info_card.dart';

// ==========================
// 🔵 GRADIENT HEADER WIDGET
// ==========================
class GradientHeader extends StatelessWidget {
  final double balance;
  final double progress;

  const GradientHeader({
    super.key,
    required this.balance,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final r = R(context);

    return Container(
      height: r.hClamp(0.44, min: 300, max: 460),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2EC4B6),
            Color(0xFF3A86FF),
            Color(0xFF8338EC),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(r.wClamp(0.08, min: 22, max: 44)),
          bottomRight: Radius.circular(
            r.wClamp(0.08, min: 22, max: 44),
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // ==========================
              // 🟦 TOP CARD (BALANCE)
              // ==========================
              Positioned(
                left: r.wClamp(0.04, min: 14, max: 30),
                right: r.wClamp(0.04, min: 14, max: 30),
                bottom: r.hClamp(156, min: 160, max: 160),
                child: InfoCard(
                  height: r.hClamp(0.14, min: 88, max: 130),
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: r.wClamp(0.07, min: 22, max: 40),
                  child: Center(
                    child: Text(
                      "Balance: \$${balance.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              // ==========================
              // 🟦 BOTTOM CARD (EARNINGS WITH PROGRESS)
              // ==========================
              Positioned(
                left: r.wClamp(0.04, min: 14, max: 30),
                right: r.wClamp(0.04, min: 14, max: 30),
                bottom: r.hClamp(0.03, min: 20, max: 55),
                child: InfoCard(
                  height: r.hClamp(0.15, min: 80, max: 120),
                  color: Colors.white.withValues(alpha: 0.20),
                  borderRadius: r.wClamp(0.06, min: 22, max: 36),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Upgrade Progress",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 12,
                            backgroundColor: Colors.white.withValues(alpha: 0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${(progress * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
