import 'package:flutter/material.dart';

import './colorPallete/ThreadColorPallete.dart';

class TabTopNavigationBar extends StatefulWidget {

  @override
  _TabTopNavigationBarState createState() => _TabTopNavigationBarState();
}

class _TabTopNavigationBarState extends State<TabTopNavigationBar> with SingleTickerProviderStateMixin {
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

  Text _tabTitle(){
    if (_currentIndex == 0){
      return Text("ALL");
    }else if (_currentIndex == 1){
      return Text("TWITTER");
    }else if (_currentIndex == 2){
      return Text("FACEBOOK");
    }
    return Text("INSTAGRAM");
  }

  TabBar _getTabs() {
    return TabBar(
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
      controller: _tabController,
    );
  }

  TabBarView _getTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Text(_currentIndex.toString()),
        Text(_currentIndex.toString()),
        Text(_currentIndex.toString()),
        Text(_currentIndex.toString()),
        // Icon(Icons.home),
        // ImageIcon(AssetImage("assets/socialMediaIcons/twitter.png")),
        // ImageIcon(AssetImage("assets/socialMediaIcons/facebook.png")),
        // ImageIcon(AssetImage("assets/socialMediaIcons/instagram.png")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _tabTitle(),
                  _getTabs(),
                ]
              )
            ),
          ),
          body: _getTabBarView()
        );
  }
}