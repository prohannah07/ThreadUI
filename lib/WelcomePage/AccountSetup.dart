import 'package:flutter/material.dart';
import '../colorPallete/ThreadColorPallete.dart';
import 'package:http/http.dart' as http;

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
      String socailMediaName, String socialMediaImagePath) {
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
                backgroundImage: AssetImage(
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
                        text: "$socailMediaName",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          ),
          onPressed: () {
            //http.get();
            String socialMedia =
                socailMediaName[0].toLowerCase() + socailMediaName.substring(1);
            String loginEndPoint =
                "http://10.0.2.2:8080/" + socialMedia + "/login";
            print(loginEndPoint);
            Future<http.Response> response = http.get(loginEndPoint);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 1],
            colors: [ThreadColorPalette.red1, ThreadColorPalette.red2],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 130.0,
              width: double.infinity,
            ),
            _accountLoginTitle(),
            Container(
              height: 80.0,
              width: double.infinity,
            ),
            _accountSignInButton("Twitter", socialMediaLogos[0]),
            Container(height: 15.0, width: double.infinity),
            _accountSignInButton("Facebook", socialMediaLogos[1]),
            Container(height: 15.0, width: double.infinity),
            _accountSignInButton("Instagram", socialMediaLogos[2]),
          ],
        ),
      ),
    );
  }
}
