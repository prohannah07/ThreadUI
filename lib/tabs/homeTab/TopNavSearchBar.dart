import 'package:flutter/material.dart';
import './../../colorPallete/ThreadColorPallete.dart';
import './../../GlobalState.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopNavSearchBar extends StatefulWidget {
  final bool focus;
  FocusNode searchFocusNode;

  TopNavSearchBar({this.focus, this.searchFocusNode});

  @override
  _TopNavSearchBarState createState() => _TopNavSearchBarState();
}

class _TopNavSearchBarState extends State<TopNavSearchBar> {
  final textController = TextEditingController();
  FocusNode myFocusNode;

  final String apiUrl = "http://10.0.2.2:8080/twitter/search?q=";
  Future<List<dynamic>> fetchUsers(q) async {
    var result = await http.get(apiUrl + q);

    if (result.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("status is 200! yeet");
      // print(result.body);
      // return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return json.decode(result.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = widget.searchFocusNode;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  OutlineInputBorder _getRoundedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    );
  }

  TextField _getTextField() {
    return TextField(
      controller: textController,
      focusNode: myFocusNode,
      cursorColor: ThreadColorPalette.red1,
      textInputAction: TextInputAction.search,
      onSubmitted: (value){
        print("search!! YEET!");
        myFocusNode.unfocus();
        print(textController.text);
        // Provider.of<SearchQueries>(context).changeQuery(textController.text);
        context.read<SearchQueries>().changeQuery(textController.text);
        textController.clear();
        print("ON PROVIDER: " +context.read<SearchQueries>().query["searchQuery"]);
        
      },
      style: TextStyle(decoration: TextDecoration.none),
      decoration: InputDecoration(
        hintText: 'search',
        fillColor: ThreadColorPalette.red1.withOpacity(.35),
        filled: true,
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        border: _getRoundedBorder(),
        // focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 30,
      child: _getTextField(),
    );
  }
}
