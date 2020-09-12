import 'package:flutter/material.dart';
import '../colorPallete/ThreadColorPallete.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../tabs/testing/testingSearch.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  List socialMediaNames = ["Twitter", "Facebook", "Instagram"];
  double imageScale = 20.0;

  // Twitter Login Info
  String twitterToken;
  String twitterTokenSecret;

  final twitterLogin = new TwitterLogin(
    consumerKey: 'puT5M56zTfzZEdXf8uxxCFDEL',
    consumerSecret: 'PDxCggP1ttRifM4rHz7Bbv5X3UhPxe3GCC1vgAFSolJJiPnxTS',
  );

  //

  Widget _twitterLoginButton() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      child: RaisedButton(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        onPressed: () async {
          final TwitterLoginResult result = await twitterLogin.authorize();

          switch (result.status) {
            case TwitterLoginStatus.loggedIn:
              var session = result.session;
              twitterToken = session.token;
              twitterTokenSecret = session.secret;
              var response = await http.post(
                "http://10.0.2.2:8080/twitter/login",
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(
                  <String, String>{
                    'key': twitterLogin.consumerKey,
                    'keySecret': twitterLogin.consumerSecret,
                    'token': twitterToken,
                    'tokenSecret': twitterTokenSecret,
                  },
                ),
              );
              break;
            case TwitterLoginStatus.cancelledByUser:
              print("Cancelled");
              break;
            case TwitterLoginStatus.error:
              print("Error");
              break;
          }
        },
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: new AssetImage(socialMediaLogos[
                  0]), //scale: imageScale, alignment: Alignment.center),
              radius: imageScale,
            ),
            Container(height: screenHeight * 0.014, width: screenWidth * 0.05),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: "Sign in to "),
                  TextSpan(
                      text: "Twitter",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      child: ButtonTheme(
        child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: new AssetImage(
                      socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
                  radius: imageScale,
                ),
                Container(
                    height: screenHeight * 0.014, width: screenWidth * 0.05),
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
            onPressed: () {}

            // onPressed: () async {
            //   //http.get();
            //   String socialMedia =
            //       socialMediaName[0].toLowerCase() + socialMediaName.substring(1);
            //   //Future<http.Response> response =  http.get('http://10.0.2.2:8080/twitter/search?q=covid');
            //   //print(response.then((textResult) {print(textResult.body);}));
            //   //print(response.then((textResult) {print(textResult.body.runtimeType);}));
            //   String loginEndPoint =
            //       "http://10.0.2.2:8080/" + socialMedia + "/login";
            //   print(loginEndPoint);
            //   //Future<http.Response> response = http.get(loginEndPoint);
            //   if (await canLaunch(loginEndPoint)) {
            //     var launchURL = await launch(loginEndPoint);
            //     print("launchURL: $launchURL");
            //   } else {
            //     throw 'Could not launch $loginEndPoint';
            //   }
            // },
            ),
      ),
    );
  }

  List<Widget> _addLoginButtons(screenWidth, screenHeight) {
    List<Widget> appsUsed = List<Widget>();
    if (!hasTwitterAccount) {
      appsUsed.add(_twitterLoginButton());
      // appsUsed
      //     .add(_accountSignInButton(socialMediaNames[0], socialMediaLogos[0]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    if (!hasFacebookAccount) {
      appsUsed
          .add(_accountSignInButton(socialMediaNames[1], socialMediaLogos[1]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    if (!hasInstagramAccount) {
      appsUsed
          .add(_accountSignInButton(socialMediaNames[2], socialMediaLogos[2]));
      appsUsed.add(Container(height: 10.0, width: double.infinity));
    }
    // Delete this later
    // if (true) {
    //   appsUsed.add(
    //     RaisedButton(
    //         child: Text("CLICK ME!"),
    //         onPressed: () async {
    //           var result = await post();
    //           print(result);
    //         }),
    //   );
    // }
    if (hasTwitterAccount || hasFacebookAccount || hasInstagramAccount) {
      double paddingVal = screenHeight * 0.2;

      Widget finishButton = Padding(
          padding: EdgeInsets.only(top: paddingVal),
          child: Container(
              width: 370.0,
              height: 70,
              child: ButtonTheme(
                  child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text(
                  "Finish",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: ThreadColorPalette.red1,
                  ),
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Searchbar())), // Should redirect to primary search screen
              ))));
      appsUsed.add(finishButton);
    }
    return appsUsed;
  }

  Widget _formatButtons(screenWidth, screenHeight) {
    if (hasTwitterAccount || hasFacebookAccount || hasInstagramAccount) {
      // Has at least 1 account --> Allow users to commplete setup
      return Column(
        children: <Widget>[
          Container(
            height: screenHeight * (1 / 6),
            width: double.infinity,
          ),
          _accountLoginTitle(),
          Container(
            height: screenHeight * (1 / 12),
            width: double.infinity,
          ),
          Container(
            height: screenHeight * 0.55,
            width: double.infinity,
            //alignment: Alignment.center,
            // color: Colors.black,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: _addLoginButtons(screenWidth, screenHeight)),
          ),
        ],
      );
    } else {
      // Users have not yet logged into an account --> Needs to provide at least 1 to continue
      return Column(
        children: <Widget>[
          Container(
            height: screenHeight * 0.17,
            width: double.infinity,
          ),
          _accountLoginTitle(),
          Container(
            height: screenHeight * 0.09,
            width: double.infinity,
          ),
          Container(
            height: screenHeight * 0.6,
            width: double.infinity,
            //alignment: Alignment.center,
            child:
                Column(children: _addLoginButtons(screenWidth, screenHeight)),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: _formatButtons(screenWidth, screenHeight),
      ),
    );
  }

  Future<List<dynamic>> search() async {
    final String apiURL = "http://10.0.2.2:8080/twitter/search?q=covid";
    var result = await http.get(apiURL);

    if (result.statusCode == 200) {
      print("Status code =200");
    } else {
      throw Exception("Failed to load search results");
    }

    return json.decode(result.body);
  }

  Future<dynamic> post() async {
    final String apiURL = "http://10.0.2.2:8080/twitter/post";
    var result = await http.get(apiURL);

    if (result.statusCode == 200) {
      print("Status code =200");
    } else {
      throw Exception("Failed to load search results");
    }

    return json.decode(result.body);
  }
}
