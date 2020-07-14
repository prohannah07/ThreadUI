import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

class ManageAccounts extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Accounts",
          style:
            TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
        ),
        backgroundColor: ThreadColorPalette.red2,
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfo())),
          child: Image(
            image: AssetImage("assets/socialMediaIcons/png/twitter.png"),
          ),
        ),
      ),
    );
  }
}

// Needs editing to handle any account being viewed
// May delete this later but included to have the social media icons have a purpose
class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Twitter Account",
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