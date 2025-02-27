import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool upcomingAlarmNotification = true;
  bool showWeather = true;
  bool showTemperature = false;
  bool soundOn = true;
  bool vibrationOn = true;
  bool showMiniTimer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Settings'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          // Alarm settings section
          ListTile(
            title: const Text(
              'Upcoming alarm notification',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              '30 minutes before',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Switch(
              value: upcomingAlarmNotification,
              onChanged: (bool value) {
                setState(() {
                  upcomingAlarmNotification = value;
                });
              },
            ),
          ),
          const Divider(color: Colors.grey),

          // World clock section
          ListTile(
            title: const Text(
              'Show weather',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: showWeather,
              onChanged: (bool value) {
                setState(() {
                  showWeather = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Temperature (°C)',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: showTemperature,
              onChanged: (bool value) {
                setState(() {
                  showTemperature = value;
                });
              },
            ),
          ),
          const Divider(color: Colors.grey),

          // Timer section
          ListTile(
            title: const Text(
              'Sound',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: soundOn,
              onChanged: (bool value) {
                setState(() {
                  soundOn = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Vibration',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: vibrationOn,
              onChanged: (bool value) {
                setState(() {
                  vibrationOn = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text(
              'Show mini timer',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: showMiniTimer,
              onChanged: (bool value) {
                setState(() {
                  showMiniTimer = value;
                });
              },
            ),
          ),
          const Divider(color: Colors.grey),

          // Privacy and more settings
          ListTile(
            title: const Text(
              'Permissions',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle permissions settings
            },
          ),
          ListTile(
            title: const Text(
              'Customization Service',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text('On', style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Handle customization settings
            },
          ),
        ],
      ),
      backgroundColor: Colors.black, // Background color for the settings page
    );
  }
}
