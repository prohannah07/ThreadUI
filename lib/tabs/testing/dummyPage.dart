import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

// void main() => runApp(Searchbar());

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class NewPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    print('beta.dart');
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<Post>(
              onSearch: search,
              onItemFound: (Post post, int index) {
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  var search;
  return Center(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<Post>(
              onSearch: search,
              onItemFound: (Post post, int index) {
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
