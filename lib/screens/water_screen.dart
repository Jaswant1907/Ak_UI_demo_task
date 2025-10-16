import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_task_demo/animated_widgets/water_indicator.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  Color whiteColor = Colors.white;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08070C),
      appBar: AppBar(
        backgroundColor: Color(0xFF08070C),
        title: Text(
          "Water Tracker",
          style: TextStyle(fontWeight: FontWeight.w600, color: whiteColor),
        ),
        leading: Icon(Icons.arrow_back_ios, color: whiteColor),
        actions: [Icon(Icons.settings, color: whiteColor)],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 489,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1D1C21),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WaterIntakeIndicator(progress: 0.4, value: 1500),
                  Text(
                    "/2500ml",
                    style: TextStyle(color: whiteColor, fontSize: 20),
                  ),
                  Row(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Drinking..."),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1F222A),
                          foregroundColor: whiteColor,
                        ),
                      ),
                      Stack(
                        alignment: AlignmentGeometry.bottomRight,

                        children: [
                          CircleAvatar(
                            radius: 30, // Example radius
                            backgroundColor: const Color(0xFF1F222A),
                            child: SvgPicture.asset(
                              'assets/images/Vector1.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 10,
                              child: SvgPicture.asset(
                                'assets/images/recycle.svg',
                                height: 20,
                                width: 20,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1D1C21), // ✅ Updated background color
        type: BottomNavigationBarType.shifting,

        unselectedItemColor: Colors.white60,
        //currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              color: Colors.blue[50],
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/water1.svg',
              color: Colors.blue[50],
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/foot.svg'),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/report.svg'),
            label: "Report",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/person.svg'),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
