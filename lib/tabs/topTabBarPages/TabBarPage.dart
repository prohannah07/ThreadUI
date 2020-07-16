import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';
import './socialMediaPostWidgets/SMPostCard.dart';

class TabBarPage extends StatelessWidget {
  String tabPageName;

  TabBarPage({this.tabPageName});

  Widget _dummyText() {
    return Center(
      child: Text(
        tabPageName,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _dummyText(),
          SMPostCard(
            imagePath: "assets/samplePosts/sampleIcon.jpg",
            name: "Hannah Fragante",
            userName: "dudeitshannah",
            socialMedia: "twitter",
            textPost:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ",
          )
        ],
      ),
    );
  }
}
