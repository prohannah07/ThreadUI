import 'package:flutter/material.dart';

import '../.././TabTopNavigationBar.dart';
import '../../TabTopNavBar.dart' as test;
import '../.././colorPallete/ThreadColorPallete.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: test.TabTopNavigationBar()
    );
  }
}
