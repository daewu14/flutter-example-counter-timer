import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final String _dateTimeString = "2022-07-23 21:00:00";
  late DateTime _dateTime;
  String _differenceStringDisplay = "";

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(_dateTimeString);
    _startCounterDateTimeDifferences();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _startCounterDateTimeDifferences() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateTime.now();
      var difference = now.difference(_dateTime);
      setState(() {
        var diffDate = DateTime(now.year,
          now.month,
          difference.inDays,
          difference.inHours,
          difference.inMinutes,
          difference.inSeconds,
        );
        _differenceStringDisplay = "${difference.inHours > 9 ? difference.inHours : "0${difference.inHours}"} : ${diffDate.minute>9 ? diffDate.minute : "0${diffDate.minute}"} : ${diffDate.second > 9 ? diffDate.second : "0${diffDate.second}"}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter time difference :',
            ),
            Text(
              _differenceStringDisplay,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 30.0),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
