import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class Alarm {
  final TimeOfDay time;
  bool isActive;

  Alarm({required this.time, this.isActive = true});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Alarm> alarms = [];

  @override
  Widget build(BuildContext context) {
    bool isButtonClicked = false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Clock App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Switch(
              autofocus: true,
              value: isButtonClicked,
              onChanged: (val) {
                setState(() {
                  isButtonClicked = val;
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: AnalogClock(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                width: 400.0,
                isLive: true,
                hourHandColor: Colors.green,
                minuteHandColor: Colors.orange,
                showSecondHand: true,
                numberColor: Colors.black87,
                showNumbers: true,
                showAllNumbers: true,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: false,
                datetime: DateTime.now(),
                secondHandColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  addAlarm();
                },
                child: const Text(
                  'Add Alarm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Column(
              children: alarms.asMap().entries.map((entry) {
                final int index = entry.key;
                final Alarm alarm = entry.value;
                return ListTile(
                  title: Text(alarm.time.format(context)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: alarm.isActive,
                        onChanged: (value) {
                          setState(() {
                            alarm.isActive = value;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            alarms.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            OutlinedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 70),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('digitalClock');
              },
              child: const Text("Digital Clock"),
            ),
            OutlinedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 70),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('stopWatch');
              },
              child: const Text("StopWatch"),
            ),
          ],
        ),
      ),
    );
  }

  void addAlarm() async {
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay != null) {
      setState(() {
        alarms.add(Alarm(time: timeOfDay));
      });
    }
  }
}
