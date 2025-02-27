import 'dart:async';
import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  Timer? _timer;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Duration _timeLeft = Duration();
  bool _isRunning = false;

  void _startTimer() {
    setState(() {
      _timeLeft = Duration(hours: _hours, minutes: _minutes, seconds: _seconds);
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft.inSeconds > 0) {
          _timeLeft = _timeLeft - const Duration(seconds: 1);
        } else {
          _timer?.cancel();
          _isRunning = false;
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _timer?.cancel();
      _isRunning = false;
    });
  }

  String _formattedTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(_timeLeft.inHours);
    String minutes = twoDigits(_timeLeft.inMinutes.remainder(60));
    String seconds = twoDigits(_timeLeft.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Set Timer",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPicker(
                title: 'Hours',
                maxValue: 99 ,
                selectedIndex: _hours,
                onChanged: (value) {
                  setState(() {
                    _hours = value;
                  });
                },
              ),
              const SizedBox(width: 25),
              _buildPicker(
                title: 'Minutes',
                maxValue: 60,
                selectedIndex: _minutes,
                onChanged: (value) {
                  setState(() {
                    _minutes = value;
                  });
                },
              ),
              const SizedBox(width: 25),
              _buildPicker(
                title: 'Seconds',
                maxValue: 60,
                selectedIndex: _seconds,
                onChanged: (value) {
                  setState(() {
                    _seconds = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            _formattedTime(),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? null : _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning ? _stopTimer : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPicker({
    required String title,
    required int maxValue,
    required int selectedIndex,
    required ValueChanged<int> onChanged,
  }) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 120, // Adjusted height to fit 3 items
          width: 60,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 40, // Height of each item
            diameterRatio: 1.5, // Adjust to change visible area
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final isSelected = index == selectedIndex;
                return Center(
                  child: Text(
                    index.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 26,
                      color: isSelected ? Colors.blueAccent : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
              childCount: maxValue,
            ),
          ),
        ),
      ],
    );
  }
}
