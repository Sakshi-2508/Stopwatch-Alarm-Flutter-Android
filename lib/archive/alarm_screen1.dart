import 'package:flutter/material.dart';

class AlarmScreen1 extends StatefulWidget {
  @override
  _AlarmScreen1State createState() => _AlarmScreen1State();
}

class _AlarmScreen1State extends State<AlarmScreen1> {
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAlarmSet = false;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Alarm Time Display
            Text(
              "${selectedTime.format(context)}",
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Time Picker Button
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text("Set Alarm Time"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Alarm Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
            SizedBox(height: 20),
            // Buttons for Set/Cancel Alarm
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Set Alarm logic here
                  },
                  child: Text("Set Alarm"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Cancel logic here
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
