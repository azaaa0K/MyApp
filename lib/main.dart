import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart' show LucideIcons;

void main() {
  runApp(MyEmpire());
}
//! create a gradient UPPER_bar background like a container , had gradinent colors 4 different colors at the corners , the container should be start at the top of the screen and at the 44
//% of the screen height and weight should be responsive to the screen width.AND at the bottom of the containner only the bottom corners should be rounded with a radius of 30.

//!create a button that the users can click faster than normal button click speed In the middle,the Space between gradient container and bottom navigation bar:
// 👉 (let’s call it ~270 px) which is a approximately 270 px and had a child text that says click on this area to earn moeny. make the button the all remaining area that left between Space between gradient container and bottom navigation bar: with a icon of clicking_hand with a biggger size

class MyEmpire extends StatefulWidget {
  const MyEmpire({super.key});

  @override
  _MyEmpireState createState() => _MyEmpireState();
}

class _MyEmpireState extends State<MyEmpire> {
  int _selectedIndex = 0;
  int clickCount = 0;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            /// 🔵 TOP GRADIENT CONTAINER
            Container(
              height: MediaQuery.of(context).size.height * 0.435,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),

            /// 🟢 CLICK AREA (FILLS REMAINING SPACE)
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque, // very important
                onTapDown: (_) {
                  setState(() {
                    clickCount++;
                    scale = 0.95;
                  });

                  debugPrint("Clicks: $clickCount");
                },
                onTapUp: (_) {
                  setState(() {
                    scale = 1.0;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    scale = 1.0;
                  });
                },

                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 80),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LucideIcons.hand, size: 80, color: Colors.black),
                        const SizedBox(height: 16),
                        const Text(
                          "Click this area to earn money",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Earnings: $clickCount",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
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
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
