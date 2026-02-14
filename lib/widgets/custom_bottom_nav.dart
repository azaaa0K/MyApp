import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart' show LucideIcons;
import '../utils/responsive.dart';

// ==========================
// 🔽 BOTTOM NAV WIDGET
// ==========================
class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final r = R(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(r.wClamp(0.06, min: 20, max: 36)),
          topRight: Radius.circular(r.wClamp(0.06, min: 20, max: 36)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: r.wClamp(0.02, min: 6, max: 14),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.chartNoAxesCombined),
            label: 'Investing',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.building2),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.circleDollarSign),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutDashboard),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.circleUser),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
