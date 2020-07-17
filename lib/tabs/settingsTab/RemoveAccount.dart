import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class RemoveAccount extends StatefulWidget{
  RemoveAccount({Key key}) : super(key: key);
  @override

  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
        title: Text(
          "Remove Account",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Select App to Remove",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}