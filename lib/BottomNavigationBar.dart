import 'package:flutter/material.dart';

import './colorPallete/ThreadColorPallete.dart';
import './tabs/homeTab/HomeTab.dart';
import './tabs/searchTab/SearchTab.dart';
import './tabs/settingsTab/SettingsTab.dart';

class ThreadBottomNavigationBar extends StatefulWidget {
  ThreadBottomNavigationBar({Key key}) : super(key: key);

  @override
  _ThreadBottomNavigationBarState createState() =>
      _ThreadBottomNavigationBarState();
}

class _ThreadBottomNavigationBarState extends State<ThreadBottomNavigationBar> {
  int _selectedIndex = 0;

  // ignore: unused_field
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    SearchTab(),
    SettingsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // icon: Icon(Icons.home),
            activeIcon:
                ImageIcon(AssetImage("assets/bottomNavBarIcons/png/home.png")),
            icon: ImageIcon(
                AssetImage("assets/bottomNavBarIcons/png/home-outline.png")),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
                AssetImage("assets/bottomNavBarIcons/png/search.png")),
            icon: ImageIcon(
                AssetImage("assets/bottomNavBarIcons/png/search-outline.png")),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
                AssetImage("assets/bottomNavBarIcons/png/settings.png")),
            icon: ImageIcon(AssetImage(
                "assets/bottomNavBarIcons/png/settings-outline.png")),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ThreadColorPalette.red1,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
