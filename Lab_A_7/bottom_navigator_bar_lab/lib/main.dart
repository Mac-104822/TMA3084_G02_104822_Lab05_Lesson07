import 'package:bottom_navigator_bar_lab/screen1.dart';
import 'package:bottom_navigator_bar_lab/screen2.dart';
import 'package:bottom_navigator_bar_lab/screen3.dart';
import 'package:bottom_navigator_bar_lab/screen4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TabModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const tabs = [
    Center(child: Screen1()),
    Center(child: Screen2()),
    Center(child: Screen3()),
    Center(child: Screen4()),
  ];

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
        body: Consumer<TabModel>(
          builder: (context, tabModel, child) => tabs[tabModel.currentIndex],
        ),
        bottomNavigationBar: Consumer<TabModel>(
          builder: (context, tabModel, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.white,
            selectedFontSize: 19.0,
            unselectedFontSize: 14.0,
            iconSize: 30.0,
            currentIndex: tabModel.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm),
                label: 'Alarm',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            onTap: (index) {
              context.read<TabModel>().setCurrentIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
