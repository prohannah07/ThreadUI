import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class TermsAndServices extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Terms and Services",
          style:
            TextStyle(fontSize: 27, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Return to Settings"),
        ),
      ),
    );
  }
}