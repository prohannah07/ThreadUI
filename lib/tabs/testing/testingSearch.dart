import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import '../../colorPallete/ThreadColorPallete.dart';
import 'dummyPage.dart';

void main() => runApp(Searchbar());

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Searchbar extends StatelessWidget {
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
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPage())),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: ThreadColorPalette.red2,
                          spreadRadius: 0.5,
                          blurRadius: 2,
                          offset: Offset(1, 6),
                        ),
                      ],
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Text("Start Your Search",
                        style: TextStyle(
                            fontSize: 24,
                            color: ThreadColorPalette.red1,
                            fontWeight: FontWeight.bold)),
                  ),
                ))

            // SafeArea(
            //   child: Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: TextFormField(
            //       onTap: () => Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => NewPage())),
            //       decoration: InputDecoration(
            //         prefixIcon:
            //             Icon(Icons.search, color: Colors.white, size: 40),
            //         hintText: "Start Your Siracha",
            //         filled: true,
            //         fillColor: Color.fromRGBO(255, 255, 255, 0.5),
            //         contentPadding: const EdgeInsets.all(25.0),
            //       ),
            //     ),
            //   ),
            // )

            // RaisedButton(
            //     color: Colors.white,
            //     child: Text("Click me"),
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => NewPage())))

            // Container(
            //     height: 120,
            //     width: double.infinity,
            //     alignment: Alignment.bottomCenter,
            //     child: _searchBar()),
          ],
        ),
      ),
    );
  }
}
