import 'package:flutter/material.dart';
import 'package:time_sphere_clock/screens/digital_screen.dart';
import 'package:time_sphere_clock/screens/home_page.dart';
import 'package:time_sphere_clock/screens/stopwatch.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        'digitalClock': (context) => const Digital(),
        'stopWatch': (context) => const StopWatch(),
      },
    ),
  );
}
