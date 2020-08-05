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

  Widget _threadLogo(screenWidth, screenHeight){
    return Container(
      // Will be replaced with logo - May have issues with height/width
      height: screenHeight*0.3,
      width: screenWidth*0.5,
      margin: EdgeInsets.only(top: screenHeight*0.06),
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

  Widget _getStartedButton(BuildContext context, screenWidth, screenHeight){
    print("ScreenWidth: $screenWidth");
    print("ScreenHeight: $screenHeight");
    return ButtonTheme(
      minWidth: screenWidth*0.85,
      height: screenHeight*0.11,
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds/welcomeScreenResized.PNG"),
              fit: BoxFit.fill,
            ),
          ),
        child: Column(
          children: <Widget>[
            Container(height: screenHeight*0.14, width: double.infinity,
            ),
            _threadTitle(),
            Container(height: screenHeight*0.01, width: double.infinity),
            _threadLogo(screenWidth, screenHeight),
            Container(height: screenHeight*0.14, width: double.infinity), // Used to space logo and text
            _getStartedButton(context, screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}