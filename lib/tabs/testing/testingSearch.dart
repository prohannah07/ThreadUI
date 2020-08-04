import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import '../../colorPallete/ThreadColorPallete.dart';

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

  Widget _searchBar(){
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
                onTap: (){},
              );
            },
            searchBarStyle: SearchBarStyle(backgroundColor: Color.fromRGBO(255, 255, 255, 0.5)),
            icon: Icon(Icons.search, color: Colors.white, size: 43),
            textStyle: TextStyle(fontSize: 22),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
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
              Container(height: 120.0, alignment: Alignment.bottomCenter, child: _searchBar()),
          ],),
        ),
      ), 
    );
  }
}

