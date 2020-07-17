import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class AddAccount extends StatefulWidget{
  AddAccount({Key key}) : super(key: key);
  @override

  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
        title: Text(
          "Add Account",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Select App to Add",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}