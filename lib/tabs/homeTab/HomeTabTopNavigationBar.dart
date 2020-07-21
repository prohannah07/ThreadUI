import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';

import '.././topTabBarPages/TabBarPage.dart';

/*
Do not have a search bar
*/

class HomeTabTopNavigationBar extends StatefulWidget {
  @override
  _HomeTabTopNavigationBarState createState() => _HomeTabTopNavigationBarState();
}

class _HomeTabTopNavigationBarState extends State<HomeTabTopNavigationBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  Text _tabTitle() {
    TextStyle smStyle = TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: ThreadColorPalette.red1,
    );

    if (_currentIndex == 0) {
      return Text(
        "ALL",
        style: smStyle,
      );
    } else if (_currentIndex == 1) {
      return Text(
        "TWITTER",
        style: smStyle,
      );
    } else if (_currentIndex == 2) {
      return Text(
        "FACEBOOK",
        style: smStyle,
      );
    }
    return Text(
      "INSTAGRAM",
      style: smStyle,
    );
  }

  TabBar _getTabs() {
    return TabBar(
      labelColor: ThreadColorPalette.red1,
      indicatorColor: ThreadColorPalette.red1,
      isScrollable: true,
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
      controller: _tabController,
    );
  }

  TabBarView _getTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        TabBarPage(tab: "all",),
        TabBarPage(tab: "twitter",),
        TabBarPage(tab: "facebook",),
        TabBarPage(tab: "instagram",),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _tabTitle(),
                _getTabs(),
              ],
            ),
          ),
        ),
        body: _getTabBarView());
  }
}
