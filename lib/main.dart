import 'package:flutter/material.dart';
import './BottomNavigationBar.dart';
import './colorPallete/ThreadColorPallete.dart';
import 'WelcomePage/WelcomePage.dart';
import './tabs/testing/testingSearch.dart';

void main() => runApp(MyApp());

class DisplayScreen extends StatefulWidget {
  DisplayScreen({Key key}) : super(key: key);
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  bool hasTwitterAccount = false;
  bool hasFacebookAccount = true;
  bool hasInstagramAccount = false;

  @override
  Widget showScreen() {
    if (this.hasTwitterAccount ||
        this.hasFacebookAccount ||
        this.hasInstagramAccount) {
      return Searchbar();
    } else {
      return WelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return showScreen();
  }
}

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
      home: DisplayScreen(), // ThreadBottomNavigationBar(),
    );
  }
}
