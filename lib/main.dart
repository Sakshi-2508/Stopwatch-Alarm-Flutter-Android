import 'package:flutter/material.dart';
import 'package:stopwatch/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define the light theme
  ThemeData _buildLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      brightness: Brightness.light,
      // Customize light theme here
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // Add other theme customizations here
    );
  }

  // Define the dark theme
  ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
      useMaterial3: true,
      brightness: Brightness.dark,
      // Customize dark theme here
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // Add other theme customizations here
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildLightTheme(), // Light theme
      darkTheme: _buildDarkTheme(), // Dark theme
      themeMode: ThemeMode.system, // Use system theme mode
      home: const HomePage(),
    );
  }
}