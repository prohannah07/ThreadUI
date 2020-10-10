import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';

import './topTabBarPages/TabBarPage.dart';
import '../searchTab/topTabBarPages/FetchTabBarTest.dart';
// import '.././topTabBarPages/FetchTabBarTest.dart';
import './TopNavSearchBar.dart';

class SearchPageTopNavigationBar extends StatefulWidget {
  String upstreamQuery;

  SearchPageTopNavigationBar({this.upstreamQuery});

  @override
  _SearchPageTopNavigationBarState createState() =>
      _SearchPageTopNavigationBarState();
}

class _SearchPageTopNavigationBarState extends State<SearchPageTopNavigationBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  FocusNode myFocusNode;
  String prevQuery = "bts";
  String currQuery; //= "twice";
  String query = "twice";

  @override
  void initState() {
    super.initState();
    currQuery = widget.upstreamQuery;
    myFocusNode = FocusNode();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    myFocusNode.addListener(() {
      debugPrint("Focus: " + myFocusNode.hasFocus.toString());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  void _changeQuery(String newQuery){
    setState(() {
      print("Old query: $query");
      query = newQuery;
    });
  }

  void _changeQuery2(String newQuery){
    setState(() {
      print("Old query: $prevQuery");
      prevQuery = currQuery;
      currQuery = newQuery;
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
          text: _currentIndex == 1 ? "TWT" : null,
          icon: _currentIndex == 1
              ? null
              : ImageIcon(
                  AssetImage("assets/socialMediaIcons/twitter.png"),
                  size: 18.0,
                ),
        ),
        Tab(
          text: _currentIndex == 2 ? "FB" : null,
          icon: _currentIndex == 2
              ? null
              : ImageIcon(
                  AssetImage("assets/socialMediaIcons/facebook.png"),
                  size: 18.0,
                ),
        ),
        Tab(
          text: _currentIndex == 3 ? "IG" : null,
          icon: _currentIndex == 3
              ? null
              : ImageIcon(
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
        FetchTabBarTwitter(finalQuery: query, prevQuery: prevQuery, currQuery: currQuery,),
        // ChangeNotifierProvider(
        //   create: (_) => SearchQueries(),
        //   child: APITestHome(),
        // ),
        // TabBarPage(
        //   tab: "all",
        // ),
        TabBarPage(
          tab: "twitter",
        ),
        TabBarPage(
          tab: "facebook",
        ),
        TabBarPage(
          tab: "instagram",
        ),
      ],
    );
  }

  _onPressedFAB() {
    print("FAB Pressed");
    myFocusNode.requestFocus();
  }

  _onPressedCancel() {
    myFocusNode.unfocus();
  }

  FloatingActionButton _getFloatingActionButton() {
    return FloatingActionButton(
      child: ImageIcon(
        AssetImage("assets/bottomNavBarIcons/png/search-outline.png"),
      ),
      backgroundColor: ThreadColorPalette.red1,
      onPressed: _onPressedFAB,
    );
  }

  _getSearchbar() {
    return Row(
      children: <Widget>[
        Container(
          width: 35,
          height: 25,
          child: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: _onPressedCancel,
            color: ThreadColorPalette.red1,
            padding: EdgeInsets.all(0),
            iconSize: 30,
          ),
        ),
        TopNavSearchBar(searchFocusNode: myFocusNode, parentQueryFunction: _changeQuery2, currQuery: currQuery,),
        // ChangeNotifierProvider(
        //   create: (_) => SearchQueries(),
        //   child: TopNavSearchBar(searchFocusNode: myFocusNode),
        // ),
        Container(
          width: 35,
          height: 25,
          child: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: _onPressedCancel,
            color: ThreadColorPalette.red1,
            padding: EdgeInsets.all(0),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // TopNavSearchBar(searchFocusNode: myFocusNode),
              _getSearchbar(),
              // _tabTitle(),
              _getTabs(),
            ],
          ),
        ),
      ),
      body: _getTabBarView(),
      floatingActionButton: _getFloatingActionButton(),
    );
  }
}