import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  final Widget child;

  ThemeWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Automatically switch between light and dark theme based on system settings
      home: child,
    );
  }
}
