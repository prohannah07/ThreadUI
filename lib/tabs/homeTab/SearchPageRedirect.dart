import 'package:flutter/material.dart';

import '../../colorPallete/ThreadColorPallete.dart';
import '../searchTab/SearchPage.dart';

class SearchPageRedirect extends StatefulWidget {
  @override
  _SearchPageRedirectState createState() => _SearchPageRedirectState();
}

class _SearchPageRedirectState extends State<SearchPageRedirect> {
  final textController = TextEditingController();
  String query = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  void _setQuery(q){
    setState(() {
      query = q;
    });
  }

  void _onSubmitSearch(context, q) {
    Navigator.of(context,).push(
      MaterialPageRoute(
        builder: (BuildContext context,) {
          return Scaffold(
            body: SearchPage(query: q,), //Center(child:Text("Search Page"),)
          );
        },
      ),
    );
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
      cursorColor: ThreadColorPalette.red1,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        _setQuery(textController.text);
        textController.clear();
        print("SEARCHED QUERY: " + query);
        _onSubmitSearch(context, query);
      },
      style: TextStyle(decoration: TextDecoration.none),
      decoration: InputDecoration(
        hintText: 'search',
        fillColor: ThreadColorPalette.red1.withOpacity(.35),
        filled: true,
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        border: _getRoundedBorder(),
      ),
    );
  }

  Widget _get() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        child: _getTextField(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 50,
        child: _getTextField(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print('beta.dart');
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: SafeArea(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: _get()
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
