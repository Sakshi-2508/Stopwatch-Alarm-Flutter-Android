// Import necessary package for UI components
import 'package:flutter/material.dart';

// Stateful widget for the AlarmScreen
class AlarmScreen2 extends StatefulWidget {
  const AlarmScreen2({super.key});

  @override
  State<AlarmScreen2> createState() => _AlarmScreen2State();
}

class _AlarmScreen2State extends State<AlarmScreen2> {
  // Stores the selected alarm time, initialized with the current time
  TimeOfDay selectedTime = TimeOfDay.now();

  // Boolean to track whether the alarm is set or not
  bool isAlarmSet = false;

  // Function to open a time picker dialog and update the selected time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display selected alarm time
          Text(
            selectedTime.format(context),
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Button to open time picker
          ElevatedButton(
            onPressed: () => _selectTime(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Set Alarm Time"),
          ),
          const SizedBox(height: 20),

          // Row with switch to turn alarm ON/OFF
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Alarm ON/OFF",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Switch(
                value: isAlarmSet,
                onChanged: (value) {
                  setState(() {
                    isAlarmSet = value;
                  });
                },
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Row with buttons for setting and canceling the alarm
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic to set the alarm goes here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Set Alarm"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Logic to cancel the alarm goes here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}