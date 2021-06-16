import 'package:flutter/material.dart';
import 'events.dart';


void main() {
  runApp(MyApp());
  }
  // Starts up when running, and opens the Eventpage OnStart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EventsPage(),
    );
  }
}