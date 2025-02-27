import 'package:flutter/material.dart';
import 'dart:ui'; // For blurring effect

class GlassHistoryScreen extends StatefulWidget {
  final List<String> initialHistory;

  const GlassHistoryScreen({Key? key, required this.initialHistory})
      : super(key: key);

  @override
  _GlassHistoryScreenState createState() => _GlassHistoryScreenState();
}

class _GlassHistoryScreenState extends State<GlassHistoryScreen> {
  late List<String> _history;

  @override
  void initState() {
    super.initState();
    // Initialize the history from the passed list
    _history = List.from(widget.initialHistory);
  }

  // Method to remove a specific record
  void _deleteRecord(int index) {
    setState(() {
      _history.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('History', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_image.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.timer, color: Colors.white),
                          title: Text(
                            'Record ${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            _history[index],
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          // Here is the delete icon
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteRecord(index); // Delete record on press
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
