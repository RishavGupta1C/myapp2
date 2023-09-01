import 'package:flutter/material.dart';
import 'package:myapp2/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.pinkAccent,
              ],
              begin: gradientStartAlignment,
              end: gradientEndAlignment,
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
