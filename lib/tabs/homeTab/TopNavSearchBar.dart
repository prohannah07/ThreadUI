import 'package:flutter/material.dart';
import './../../colorPallete/ThreadColorPallete.dart';

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
        textController.clear();
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
