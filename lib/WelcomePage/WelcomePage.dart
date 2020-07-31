import 'package:flutter/material.dart';
import '../colorPallete/ThreadColorPallete.dart';
import 'AccountSetup.dart';
// import 'package:google_fonts/google_fonts.dart';

// Runs outside of main App for testing purposes
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget{

  Widget _threadTitle(){
    return Text(
      "Welcome to Thread!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48, 
        color: Colors.white, 
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
            Shadow(
              blurRadius: 9.0,
              offset: Offset(1, 2),
              color: Colors.black,
            ),
          ],
        ),
      );
  }

  Widget _threadLogo(){
    return Container(
      // Will be replaced with logo
      height: 200.0,
      width: 200.0,
      margin: EdgeInsets.only(top: 45.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ThreadColorPalette.red2,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(1, 8),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _appInfoText(){
    return Container(
      height: 25, width: double.infinity,
      child: Text(
        "< Insert Intro here >",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _getStartedButton(BuildContext context){
    return ButtonTheme(
      minWidth: 280.0,
      height: 70.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Text("Get Started",
          style: TextStyle(
            fontSize: 33.0,
            color: ThreadColorPalette.red1,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.white,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSetup()))),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 1],
            colors: [
              ThreadColorPalette.red1,
              ThreadColorPalette.red2
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(height: 70.0, width: double.infinity,
            ),
            _threadTitle(),
            Container(height: 15, width: double.infinity),
            _threadLogo(),
            Container(height: 95, width: double.infinity), // Used to space logo and text
            _getStartedButton(context),
          ],
        ),
      ),
    );
  }
}