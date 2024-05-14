import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init(showDebugLogs: true);
  runApp(const MyApp());
}

void emptyFunction() async {
  var random = Random();
  int day = random.nextInt(30) + 1;
  int month = random.nextInt(11) + 1;
  String year = '2024';

  String hour = '${random.nextInt(23) + 1}';
  String minutes = '${random.nextInt(59) + 1}';

  DateTime dateTime = DateTime.parse('$year-$month-$day $hour:$minutes:00');

  final alarmSettings = AlarmSettings(
      id: 1,
      dateTime: dateTime,
      assetAudioPath: 'assets/alarm.mp3',
      notificationTitle: 'Wakey Wakey',
      volume: 0.8,
      fadeDuration: 3.0,
      notificationBody: 'Eggs & Bakey',
      enableNotificationOnKill: true);
  print(dateTime);
  await Alarm.set(alarmSettings: alarmSettings);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Troller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 230, 213),
        appBar: AppBar(
            title: Center(
                child: Text("Alarm Troller",
                    style: TextStyle(
                        color: Color.fromARGB(255, 157, 190, 183),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500))),
            elevation: 0,
            backgroundColor: Color.fromARGB(0, 157, 190, 183)),
        body: Center(
          child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Color.fromARGB(160, 231, 50, 19),
                  borderRadius: BorderRadius.circular(255)),
              child: IconButton(
                iconSize: 50,
                icon: Icon(Icons.alarm),
                onPressed: () => emptyFunction(),
              )),
        ));
  }
}
