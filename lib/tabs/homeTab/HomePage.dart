import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import '../../colorPallete/ThreadColorPallete.dart';
// import 'dummyPage.dart';
import '../settingsTab/SettingsTab.dart';
import '../searchTab/SearchPage.dart';
import './SearchPageRedirect.dart';

void main() => runApp(Searchbar());

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Searchbar extends StatelessWidget {
  final changeLoginStatus;
  final returnLoginStatus;

  Searchbar({Key key, this.changeLoginStatus, this.returnLoginStatus})
      : super(key: key);

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(5, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }
  //search.length vs set number of results, refer to line 16

  // ignore: unused_element
  Widget _searchBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<Post>(
          onSearch: search,
          onItemFound: (Post post, int index) {
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.description),
              onTap: () {},
            );
          },
          searchBarStyle: SearchBarStyle(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.5)),
          icon: Icon(Icons.search, color: Colors.white, size: 43),
          textStyle: TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(
            changeLoginStatus: changeLoginStatus,
            returnLoginStatus: returnLoginStatus));
  }
}

class Home extends StatelessWidget {
  final changeLoginStatus;
  final returnLoginStatus;

  Home({Key key, this.changeLoginStatus, this.returnLoginStatus})
      : super(key: key);

  void _onPostTap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: SearchPageRedirect(), //Center(child:Text("Search Page"),)
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.settings, size: 30),
          backgroundColor: ThreadColorPalette.red1,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsTab(
                  changeLoginStatus: changeLoginStatus,
                  returnLoginStatus: returnLoginStatus,
                ),
              ))),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/mainBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "THREAD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () => _onPostTap(context),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  height: 65,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}