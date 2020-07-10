import 'package:flutter/material.dart';
import './BottomNavigationBar.dart';
import './colorPallete/ThreadColorPallete.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ThreadColorPalette.red1),
      home: ThreadBottomNavigationBar(),
    );
  }
}

