import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';

class TabBarPage extends StatelessWidget {
  String tabPageName;

  TabBarPage({this.tabPageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          tabPageName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
