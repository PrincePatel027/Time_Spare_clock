import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class Digital extends StatefulWidget {
  const Digital({super.key});

  @override
  State<Digital> createState() => _DigitalState();
}

class _DigitalState extends State<Digital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Digital Clock',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: DigitalClock(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              showSeconds: false,
              isLive: false,
              digitalClockTextColor: Colors.black,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              datetime: DateTime.now(),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  horizontal: 80,
                ),
              ),
            ),
            child: const Text('Other Clock'),
          ),
        ],
      ),
    );
  }
}
