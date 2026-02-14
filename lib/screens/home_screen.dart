import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/gradient_header.dart';
import '../widgets/tap_area.dart';
import '../widgets/custom_bottom_nav.dart';

import '../models/player_progress.dart';

// ==========================
// 🏠 HOME SCREEN
// ==========================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  
  // Initialize player progress
  final PlayerProgress _progress = PlayerProgress();

  @override
  Widget build(BuildContext context) {
    // Initialize Responsive helper to ensure it's available if needed directly,
    // though child widgets instantiate their own.
    // ignore: unused_local_variable
    final r = R(context);

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),

      body: Column(
        children: [
          // ==========================
          // 🔵 HEADER SECTION
          // ==========================
          GradientHeader(
            balance: _progress.currentBalance,
            progress: _progress.progressToNextUpgrade,
          ),

          // ==========================
          // 🟢 MAIN INTERACTION AREA
          // ==========================
          Expanded(
            child: TapArea(
              clickValue: _progress.clickValue,
              canUpgrade: _progress.canUpgrade,
              upgradeCost: _progress.upgradeCost,
              onUpgrade: () {
                setState(() {
                  _progress.upgrade();
                });
              },
              onTap: () {
                setState(() {
                  _progress.click();
                });
              },
            ),
          ),
        ],
      ),

      // ==========================
      // 🔽 NAVIGATION
      // ==========================
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }
}
