  
import 'package:flutter/material.dart';

import 'SearchPageTopNavigationBar.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class SearchPage extends StatelessWidget {
  String query;

  SearchPage({this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchPageTopNavigationBar(upstreamQuery: query,)
    );
  }
}