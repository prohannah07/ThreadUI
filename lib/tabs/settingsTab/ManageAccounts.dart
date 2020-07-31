import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../.././colorPallete/ThreadColorPallete.dart';
import 'RemoveAccount.dart';
import 'LoginPages/Login.dart';

// Not used anymore

class ManageAccount extends StatefulWidget{
  ManageAccount({Key key}) : super(key: key);
  @override

  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount>{
  List imageScales = [1.62, 1.6, 4.1];
  List accountNames = ["Twitter", "Facebook", "Instagram"];
  List socialMediaLogos = ["assets/socialMediaIcons/png/twitter.png", "assets/socialMediaIcons/png/facebook_logo.png", "assets/socialMediaIcons/png/instagram_logo.png"];
  bool hasTwitterAccount = true;
  bool hasFacebookAccount = true;
  bool hasInstagramAccount = true;
  int index = 0;

  Widget _socialMediaIconHandler(String socialMediaName, String socialMediaImagePath, double imageScale){
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen(
        accountInfo: LoginInfo(
          "$socialMediaName Username",
          socialMediaName,
          socialMediaImagePath,
        ),
        ))),
        //child: Image.asset(socialMediaImagePath, scale: imageScale, alignment: Alignment.center),
        child: CircleAvatar(
          backgroundImage: AssetImage(socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
          radius: 65.0,
          ),
        );
  }

  List<Widget> _formatApps(){
    List<Widget> appsUsed = List<Widget>();
    if (hasTwitterAccount){
      appsUsed.add(_socialMediaIconHandler(accountNames[0], socialMediaLogos[0], imageScales[0]));
    }
    if (hasFacebookAccount){
      appsUsed.add(_socialMediaIconHandler(accountNames[1], socialMediaLogos[1], imageScales[1]));
    }
    if (hasInstagramAccount){
      appsUsed.add(_socialMediaIconHandler(accountNames[2], socialMediaLogos[2], imageScales[2]));
    }
    return appsUsed;
  }

  Widget _displayApps(){
    if (hasTwitterAccount && hasFacebookAccount && hasInstagramAccount){
      return Container(
        height: 150.0,
        width: double.infinity,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _formatApps(),
        ),
      ); 
    }
    else{
      return Container(
        height: 150.0,
        width: 310.0,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _formatApps(),
        ),
      ); 
    }
  }

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
          _displayApps(),
          Container(height: 30.0, width: double.infinity),
          ButtonTheme(
            height: 50.0,
            minWidth: 300.0,
            child: RaisedButton(
              color: ThreadColorPalette.red1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => 
                AccountLogin())),
              child: Text(
                "Add Account",
                style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
          ),
          Container(height: 15.0, width: double.infinity),
          ButtonTheme(
            height: 50.0,
            minWidth: 300.0,
            child: RaisedButton(
              color: ThreadColorPalette.red1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                 ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => 
              RemoveAccount(hasTwitterAccount: hasTwitterAccount, hasFacebookAccount: hasFacebookAccount, hasInstagramAccount: hasInstagramAccount))),
                 child: Text(
                   "Remove Account",
                   style:
                   TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                     fontSize: 27,
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