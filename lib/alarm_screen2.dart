// AlarmScreen implementation
import 'package:flutter/material.dart';

class AlarmScreen2 extends StatefulWidget {
  const AlarmScreen2({super.key});

  @override
  State<AlarmScreen2> createState() => _AlarmScreen2State();
}

class _AlarmScreen2State extends State<AlarmScreen2> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAlarmSet = false;

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
          Text(
            selectedTime.format(context),
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Set Alarm logic here
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
                  // Cancel logic here
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
