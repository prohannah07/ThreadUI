import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Thread');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThreadColorPalette.red2,
        centerTitle: true,
        title: Text(
          "T",
          style: 
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,),
            ),
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: 
            TextField(
              decoration: InputDecoration(
                hintText: "Search for...",
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.left,
                ),
              decoration: BoxDecoration(
                color: ThreadColorPalette.red1,
              ),
            ),
            ListTile(
              title: Text("Filter 1"),
              onTap: (){
                 Navigator.pop(context);
                },
            ),
            ListTile(
              title: Text("Filter 2"),
              onTap: (){
                Navigator.pop(context);
                },
              ),
            ListTile(
            title: Text("Filter 3"),
            onTap: (){
               Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Filter 4"),
              onTap: (){
                 Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}

// class SearchTab extends StatelessWidget {
//   @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Text(
//          "SEARCH TAB!",
//          style: TextStyle(
//            fontSize: 30,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//      ),
//    );
//  }
//}

