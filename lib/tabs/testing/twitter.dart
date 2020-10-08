import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_twitter/flutter_twitter.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String twitterToken;
  String twitterTokenSecret;

  final twitterLogin = new TwitterLogin(
    consumerKey: 'sCAgOQq0DPe6OWSxTrEMpFEkc',
    consumerSecret: 'slAbLRO2HnfmUfhDGSD1wCDXLI8iwJBRo3qHa4jMxop7vPtBVL',
  );

  Widget _twitterLoginButton() {
    return Container(
      width: 150,
      height: 150,
      child: RaisedButton(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        onPressed: () async {
          final TwitterLoginResult result = await twitterLogin.authorize();

          switch (result.status) {
            case TwitterLoginStatus.loggedIn:
              // Change login status of Twitter to true

              print("Logged into Twitter! Yay");
              var session = result.session;
              twitterToken = session.token;
              twitterTokenSecret = session.secret;
              // ignore: unused_local_variable
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
        child: Text("Click me to Log in! :)"),
      ),
    );
  }

  void _logout() async {
    await twitterLogin.logOut();

    print("You have logged out... :(");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Twitter Testing")),
            body: Center(
                child: Column(
              children: [
                _twitterLoginButton(),
                RaisedButton(
                  child: Text("Click me to Log out!"),
                  onPressed: _logout,
                )
              ],
            ))));
  }
}
