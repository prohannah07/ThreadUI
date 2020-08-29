import 'package:flutter/material.dart';
import './BottomNavigationBar.dart';
import './colorPallete/ThreadColorPallete.dart';
import 'WelcomePage/WelcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasTwitterAccount;
  bool hasFacebookAccount;
  bool hasInstagramAccount;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ThreadColorPalette.red1),
      home: WelcomeScreen(), // ThreadBottomNavigationBar(),
    );
  }
}
