import 'package:flutter/material.dart';
import 'package:sehatin/Artikel/home.dart';
import 'package:sehatin/utils/global.colors.dart';
import 'package:sehatin/view/homepage.dart';
import 'package:sehatin/view/weather.view.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  final screens = [
    Homepage(),
    const Weather(),
    const Arikel(),

    // const ProfileView(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: GlobalColors.mainColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.sunny),
              label: 'Cuaca',
              backgroundColor: GlobalColors.mainColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: 'Artikel',
              backgroundColor: GlobalColors.mainColor),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: GlobalColors.mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
