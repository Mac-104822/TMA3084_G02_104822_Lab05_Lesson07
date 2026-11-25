import 'package:bottom_navigator_bar_lab/screen1.dart';
import 'package:bottom_navigator_bar_lab/screen2.dart';
import 'package:bottom_navigator_bar_lab/screen3.dart';
import 'package:bottom_navigator_bar_lab/screen4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class BottomNavigationModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavigationModel(),
      child: const MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const tabs = [
    Center(child: Screen1()),
    Center(child: Screen2()),
    Center(child: Screen3()),
    Center(child: Screen4()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Bottom Navigation Bar',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
      body: Selector<BottomNavigationModel, int>(
        selector: (_, model) => model.currentIndex,
        builder: (_, currentIndex, _) => tabs[currentIndex],
      ),
      bottomNavigationBar: Selector<BottomNavigationModel, int>(
        selector: (_, model) => model.currentIndex,
        builder: (_, currentIndex, _) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 19.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: currentIndex,
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
          onTap: (index) =>
              context.read<BottomNavigationModel>().setIndex(index),
        ),
      ),
    );
  }
}
