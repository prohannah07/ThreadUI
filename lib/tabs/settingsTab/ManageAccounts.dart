import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';
import 'AddAccount.dart';
import 'RemoveAccount.dart';

class ManageAccount extends StatefulWidget{
  ManageAccount({Key key}) : super(key: key);
  @override

  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount>{
  List accountNames = ["Twitter", "Facebook", "Instagram"];
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
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfo())),
                child: Image.asset("assets/socialMediaIcons/png/twitter.png", scale: 1.65, alignment: Alignment.center),
              ),
              Spacer(),
              // Facebook Account
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfo())),
                child: Image.asset("assets/socialMediaIcons/png/facebook_logo.png", scale: 1.6, alignment: Alignment.center),
              ),
              Spacer(),
              // Instagram Account
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfo())),
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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddAccount())),
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

// Needs editing to handle any account being viewed
// May delete this later but included to have the social media icons have a purpose
class AccountInfo extends StatefulWidget{
  AccountInfo({Key key}) : super(key:key);
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Information",
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
          Text(
            // Will need to replace the Username and Password with the one used by the actual User
            "Username: \n USER1 \n",
            textAlign: TextAlign.center,
            style:
            TextStyle(
              fontSize: 40,
            ),
          ),
          Icon(
            // Will replace icon with User profile picture - Saved as placeholder
            Icons.account_circle,
            color: Colors.blue[600],
            size: 100.0,
          ),
        ],
      ),
    );
  }
}

