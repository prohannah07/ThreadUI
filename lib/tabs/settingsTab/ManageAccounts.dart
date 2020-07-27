import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../.././colorPallete/ThreadColorPallete.dart';
import 'RemoveAccount.dart';
import 'LoginPages/Login.dart';

class ManageAccount extends StatefulWidget{
  ManageAccount({Key key}) : super(key: key);
  @override

  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount>{
  List accountNames = ["Twitter", "Facebook", "Instagram"];
  List socialMediaLogos = ["assets/socialMediaIcons/png/twitter.png", "assets/socialMediaIcons/png/facebook_logo.png", "assets/socialMediaIcons/png/instagram_logo.png"];
  bool hasTwitterAccount = false;
  bool hasFacebookAccount = false;
  bool hasInstagramAccount = false;
  int index = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Accounts",
          style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
        ),
        backgroundColor: ThreadColorPalette.red2,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Row(
            children: <Widget> [
              // Twitter Account
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen(
                  accountInfo: LoginInfo(
                    "${accountNames[0]} Username",
                    accountNames[0],
                    socialMediaLogos[0],
                  ),
                ))),
                child: Image.asset("assets/socialMediaIcons/png/twitter.png", scale: 1.65, alignment: Alignment.center),
              ),
              Spacer(),
              // Facebook Account
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen(
                  accountInfo: 
                    LoginInfo(
                      "${accountNames[1]} Username",
                      accountNames[1],
                      socialMediaLogos[1]
                  ),
                ))),
                child: Image.asset("assets/socialMediaIcons/png/facebook_logo.png", scale: 1.6, alignment: Alignment.center),
              ),
              Spacer(),
              // Instagram Account
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen(
                  accountInfo: 
                    LoginInfo(
                      "${accountNames[2]} Username",
                      accountNames[2],
                      socialMediaLogos[2]
                      // "assets/socialMediaIcons/png/instagram_logo.png"
                  ),
                ))),
                child: Image.asset("assets/socialMediaIcons/png/instagram_logo.png", scale: 4.1, alignment: Alignment.center), 
              ),
            ],
          ),
          Container(
            height: 50.0,
            width: 250.0,
            alignment: Alignment.center,
            child: RaisedButton(
              color: ThreadColorPalette.red1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountLogin())),
              child: Text(
                "Add Account",
                style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 250.0,
            alignment: Alignment.center,
            child: RaisedButton(
              color: ThreadColorPalette.red1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                 ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveAccount())),
                 child: Text(
                   "Remove Account",
                   style:
                   TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
      );
  }
}

class LoginInfo{
  final String username;
  final String socialMediaName;
  final String imageName;

  LoginInfo(this.username, this.socialMediaName, this.imageName);
}

class AccountInfoScreen extends StatelessWidget{
  final LoginInfo accountInfo;

  AccountInfoScreen({Key key, @required this.accountInfo}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${accountInfo.socialMediaName} Profile",
          style:
          TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        // Initially displayed the social media logo at the top
        //  Container(
        //    width: 150,
        //    height: 130,
        //    child:
        //      Image.asset(accountInfo.imageName, scale: 2.0, alignment: Alignment.topCenter),
        //  ),
          Padding(
            padding: EdgeInsets.zero,
            child: Icon(
            // Will replace icon with User profile picture - Saved as placeholder
            Icons.account_circle,
            color: Colors.blue[600],
            size: 135.0,
            ),
          ),
          Padding(
            // padding: EdgeInsets.only(top: 40.0),
            padding: EdgeInsets.only(top: 10.0),
            child:
              Text(
               // Will need to replace the Username and Password with the one used by the actual User
              "Username: \n ${accountInfo.username} \n",
              textAlign: TextAlign.center,
             style:
              TextStyle(
                fontSize: 40,
             ),
           ),
          ),
        ],
      ),
    );
  }
}