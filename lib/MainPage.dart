import 'package:flutter/material.dart';

import 'category1_screen.dart';
import 'category2_screen.dart';
import 'category3_screen.dart';
import 'category4_screen.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  static final List<Widget> _widgetOptions = <Widget>[
    Category1Screen(),
    Category2Screen(),
    HomeScreen(),
    Category3Screen(),
    Category4Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category 4',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}