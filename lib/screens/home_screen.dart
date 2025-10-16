import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure you have flutter_svg installed

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. State Variable to track the selected tab index
  int _currentIndex = 0;

  // 2. List of Widgets (pages) corresponding to the tabs
  final List<Widget> _pages = [
    // Replace these with your actual page widgets
    const Center(
      child: Text('Home Page Content', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text('Search Page Content', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text(
        'Favorites Page Content',
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Center(
      child: Text('Report Page Content', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text(
        'Profile Page Content',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];

  // 3. Method to update the index when a tab is pressed
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background color for the main content area
      backgroundColor: const Color(0xFF0F0F0F),

      // 4. Display the page corresponding to the current index
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1D1C21),
        type: BottomNavigationBarType.shifting,

        unselectedItemColor: Colors.white60,
        selectedItemColor:
            Colors.lightBlueAccent, // Add a selected color for visual feedback
        // 5. Connect the state variable to show the selected tab
        currentIndex: _currentIndex,

        // 6. Connect the update function to the onTap handler
        onTap: _onTabTapped,

        items: [
          // Index 0
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 0 ? Colors.lightBlueAccent : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          // Index 1
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Vector.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 1 ? Colors.lightBlueAccent : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Search",
          ),
          // Index 2
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/foot.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 2 ? Colors.lightBlueAccent : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Favorites",
          ),
          // Index 3
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/report.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 3 ? Colors.lightBlueAccent : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Report",
          ),
          // Index 4
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/person.svg',
              colorFilter: ColorFilter.mode(
                _currentIndex == 4 ? Colors.lightBlueAccent : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
