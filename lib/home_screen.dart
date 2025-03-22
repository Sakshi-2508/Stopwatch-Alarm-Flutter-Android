import 'package:flutter/material.dart';
import 'package:stopwatch/alarm_screen2.dart';
import 'package:stopwatch/stopwatch_screen.dart';
import 'package:stopwatch/timer_screen.dart'; // Importing different screens

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index to keep track of the selected bottom navigation item
  int _selectedIndex = 0;

  // Function to update the selected index when a bottom navigation item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to return the appropriate screen based on the selected index
  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return AlarmScreen2(); // Display Alarm screen
      case 1:
        return StopwatchScreen(); // Display Stopwatch screen
      case 2:
        return const TimerApp(); // Display Timer screen
      case 3:
      default:
        return AlarmScreen2(); // Default to Alarm screen if index is out of range
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stopwatch App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // Setting app bar background color
      ),
      body: _getScreen(_selectedIndex), // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_3),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Update index when tapped
        selectedItemColor: Colors.blueAccent, // Highlighted item color
        unselectedItemColor: Colors.grey, // Non-selected item color
        backgroundColor: Colors.black12, // Background color for the navigation bar
      ),
    );
  }
}
