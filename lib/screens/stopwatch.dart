import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "StopWatch",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(stopwatch.elapsedMilliseconds),
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? stop : start,
                  child: Text(isRunning ? 'Stop' : 'Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void start() {
    setState(() {
      isRunning = true;
    });
    updateUI();
  }

  void updateUI() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (isRunning) {
        setState(() {});
        updateUI();
      }
    });
  }

  void stop() {
    stopwatch.stop();
    setState(() {
      isRunning = false;
    });
  }

  void reset() {
    stopwatch.reset();
    setState(() {});
  }

  String formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitHundred(int n) {
      if (n >= 100) return "$n";
      if (n >= 10) return "0$n";
      return "00$n";
    }

    hundreds = hundreds % 100;
    seconds = seconds % 60;

    return "${twoDigits(minutes)}:${twoDigits(seconds)}:${twoDigitHundred(hundreds)}";
  }
}
