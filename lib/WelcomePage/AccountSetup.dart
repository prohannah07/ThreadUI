import 'package:flutter/material.dart';
import '../colorPallete/ThreadColorPallete.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart';

class AccountSetup extends StatefulWidget {
  @override
  _AccountSetupState createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  bool hasTwitterAccount = false;
  bool hasFacebookAccount = false;
  bool hasInstagramAccount = false;
  List socialMediaLogos = [
    "assets/socialMediaIcons/png/twitter.png",
    "assets/socialMediaIcons/png/facebook_logo.png",
    "assets/socialMediaIcons/png/instagram_logo.png"
  ];
  List socialMediaNames = [
    "Twitter",
    "Facebook",
    "Instagram"
  ];

  double imageScale = 20.0;

  Widget _accountLoginTitle() {
    return Text(
      "Login to Your Social Media Apps",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
        color: Colors.white,
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

   

  Widget _accountSignInButton(
    String socialMediaName, String socialMediaImagePath) {
    return Container(
      width: 370.0,
      height: 70,
      child: ButtonTheme(
        child: RaisedButton(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: new AssetImage(
                    socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
                radius: imageScale,
              ),
              Container(height: 10, width: 25),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Sign in to "),
                    TextSpan(
                        text: "$socialMediaName",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
          onPressed:(){},
          /*
          onPressed: () async {
            //http.get();
            String socialMedia =
                socialMediaName[0].toLowerCase() + socialMediaName.substring(1);
            //Future<http.Response> response =  http.get('http://10.0.2.2:8080/twitter/search?q=covid');
            //print(response.then((textResult) {print(textResult.body);}));
            //print(response.then((textResult) {print(textResult.body.runtimeType);}));
            String loginEndPoint =
                "http://10.0.2.2:8080/" + socialMedia + "/login";
            print(loginEndPoint);
            //Future<http.Response> response = http.get(loginEndPoint);
            if (await canLaunch(loginEndPoint)){
              await launch(loginEndPoint);
            }
            else{
              throw 'Could not launch $loginEndPoint';
            }
          },
          */
        ),
      ),
    );
  }

   List<Widget> _addLoginButtons(){
    List<Widget> appsUsed = List<Widget>();
    if (!hasTwitterAccount){
      appsUsed.add(_accountSignInButton(socialMediaNames[0], socialMediaLogos[0]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    if (!hasFacebookAccount){
      appsUsed.add(_accountSignInButton(socialMediaNames[1], socialMediaLogos[1]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    if (!hasInstagramAccount){
      appsUsed.add(_accountSignInButton(socialMediaNames[2], socialMediaLogos[2]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    if (hasTwitterAccount || hasFacebookAccount || hasInstagramAccount){
      double paddingVal = 120.0;
      int len = appsUsed.length;
      if (appsUsed.length == 2){paddingVal = 150.0;}
    
      Widget finishButton = Padding(
        padding: EdgeInsets.only(top: paddingVal),
        child: Container(
        width: 370.0,
        height: 70,
        child: ButtonTheme(
          child: RaisedButton(
            color: Colors.white,
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            child: Text("Finish", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,
              color: ThreadColorPalette.red1,
            ),),
            onPressed: (){}, // Should redirect to primary search screen
            )
          )
        )
      );      
      appsUsed.add(finishButton);
    }
    return appsUsed;
  }

  Widget _formatButtons(){
    if (hasTwitterAccount || hasFacebookAccount || hasInstagramAccount){ // Has at least 1 account --> Allow users to commplete setup
      return Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: double.infinity,
          ),
          _accountLoginTitle(),
          Container(
            height: 60.0,
            width: double.infinity,
          ),
          Container(
            height: 370.0,
            width: double.infinity,
            //alignment: Alignment.center,
            // color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: _addLoginButtons()),
            ),
          ],
        );
    }
    else{ // Users have not yet logged into an account --> Needs to provide at least 1 to continue
      return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: double.infinity,
        ),
        _accountLoginTitle(),
        Container(
          height: 60.0,
          width: double.infinity,
        ),
        Container(
          height: 370.0,
          width: double.infinity,
          //alignment: Alignment.center,
          // color: Colors.black,
          child: Column(
            children: _addLoginButtons()),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: _formatButtons(),
      ),
    );
  }
}
