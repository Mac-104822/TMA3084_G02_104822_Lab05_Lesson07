import 'package:bottom_navigator_bar_lab/screen1.dart';
import 'package:bottom_navigator_bar_lab/screen2.dart';
import 'package:bottom_navigator_bar_lab/screen3.dart';
import 'package:bottom_navigator_bar_lab/screen4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final tabs = [
    const Center(child: Screen1()),
    const Center(child: Screen2()),
    const Center(child: Screen3()),
    const Center(child: Screen4()),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Bottom Navigation Bar',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 19.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Alarm',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
