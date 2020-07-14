import 'package:flutter/material.dart';

import './colorPallete/ThreadColorPallete.dart';

class TabTopNavigationBar extends StatelessWidget {

  Widget _getTabs(){
    return TabBar(
      // indicatorPadding: EdgeInsets.only(bottom: 7),
      labelColor: ThreadColorPalette.red1,
      indicatorColor: ThreadColorPalette.red1,
      tabs: [
        Tab(
          text: "ALL",
        ),
        Tab(
          icon: ImageIcon(
            AssetImage("assets/socialMediaIcons/twitter.png"),
            size: 18.0,
          ),
        ),
        Tab(
          icon: ImageIcon(
            AssetImage("assets/socialMediaIcons/facebook.png"),
            size: 18.0,
          ),
        ),
        Tab(
          icon: ImageIcon(
            AssetImage("assets/socialMediaIcons/instagram.png"),
            size: 15.0,
          ),
        ),
      ],
    );
  }

  TabBarView _getTabPages() {
    return TabBarView(
      children: [
        Icon(Icons.home),
        ImageIcon(AssetImage("assets/socialMediaIcons/twitter.png")),
        ImageIcon(AssetImage("assets/socialMediaIcons/facebook.png")),
        ImageIcon(AssetImage("assets/socialMediaIcons/instagram.png")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _getTabs(),
                ]
              )
            ),
          ),
          body: _getTabPages()
        ),
      ),
    );
  }
}

