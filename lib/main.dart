import 'package:flutter/material.dart';
import './colorPallete/ThreadColorPallete.dart';
import 'WelcomePage/WelcomePage.dart';
import './tabs/testing/testingSearch.dart';

void main() => runApp(MyApp());

class DisplayScreen extends StatefulWidget {
  final changeLoginStatus;
  final returnLoginStatus;

  DisplayScreen({Key key, this.changeLoginStatus, this.returnLoginStatus})
      : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List accountNames = ["Twitter", "Facebook", "Instagram"];

  Widget showScreen() {
    if (widget.returnLoginStatus(accountNames[0]) ||
        widget.returnLoginStatus(accountNames[1]) ||
        widget.returnLoginStatus(accountNames[2])) {
      return Searchbar(
          changeLoginStatus: widget.changeLoginStatus,
          returnLoginStatus: widget.returnLoginStatus);
    } else {
      return WelcomeScreen(
        changeLoginStatus: widget.changeLoginStatus,
        returnLoginStatus: widget.returnLoginStatus,
      );
    }
  }

  Widget build(BuildContext context) {
    return showScreen();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasTwitterAccount = false;
  bool hasFacebookAccount = false;
  bool hasInstagramAccount = false;

  void _changeLoginStatus(bool loginStatus, String socialMediaName) {
    if (socialMediaName == "Twitter") {
      setState(() {
        hasTwitterAccount = loginStatus;
      });
    } else if (socialMediaName == "Facebook") {
      setState(() {
        hasFacebookAccount = loginStatus;
      });
    } else if (socialMediaName == "Instagram") {
      setState(() {
        hasInstagramAccount = loginStatus;
      });
    } else {
      throw ("Social Media Account: '$socialMediaName' not found.");
    }
  }

  bool _returnLoginStatus(String socialMediaName) {
    if (socialMediaName == "Twitter") {
      return hasTwitterAccount;
    } else if (socialMediaName == "Facebook") {
      return hasFacebookAccount;
    } else if (socialMediaName == "Instagram") {
      return hasInstagramAccount;
    } else {
      throw ("Social Media Account: '$socialMediaName' does not exist.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ThreadColorPalette.red1),
      home: DisplayScreen(
          changeLoginStatus: _changeLoginStatus,
          returnLoginStatus: _returnLoginStatus),
    );
  }
}
