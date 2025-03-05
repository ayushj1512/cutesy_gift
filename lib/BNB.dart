import 'package:cutesy_gifts/rewardingscreen.dart';
import 'package:cutesy_gifts/homescreen.dart';
import 'package:cutesy_gifts/profile.dart';
import 'package:flutter/material.dart';

class Bnb extends StatefulWidget {
  const Bnb({super.key});

  @override
  State<Bnb> createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  int _selectedIndex = 0;

  // List of screens for different tabs
  final List<Widget> _screens = [
    Homescreen(),
    RewardingLevelsScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 147, 26, 1),
        toolbarHeight: 20,
      ),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(247, 147, 26, 1),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,

          // Active icon color
          showSelectedLabels: false, // Hide labels
          showUnselectedLabels: false, // Hide labels
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/home.png", height: 40, width: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/app.png", height: 45, width: 45),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/profile.png", height: 40, width: 40),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
