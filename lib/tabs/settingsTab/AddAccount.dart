import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

// ignore: must_be_immutable
class AddAccount extends StatefulWidget {
  List imageScales = [1.62, 1.6, 4.1];
  List accountNames = ["Twitter", "Facebook", "Instagram"];
  List socialMediaLogos = [
    "assets/socialMediaIcons/png/twitter.png",
    "assets/socialMediaIcons/png/facebook_logo.png",
    "assets/socialMediaIcons/png/instagram_logo.png"
  ];
  bool hasTwitterAccount;
  bool hasFacebookAccount;
  bool hasInstagramAccount;
  double screenHeight;
  double screenWidth;

  AddAccount(
      {@required this.hasTwitterAccount,
      this.hasFacebookAccount,
      this.hasInstagramAccount,
      this.screenHeight,
      this.screenWidth,
      Key key})
      : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  Widget _socialMediaIconHandler(
      String socialMediaName, String socialMediaImagePath, double imageScale) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountInfoScreen(
                    accountInfo: LoginInfo(
                      "$socialMediaName Username",
                      socialMediaName,
                      socialMediaImagePath,
                    ),
                  ))),
      //child: Image.asset(socialMediaImagePath, scale: imageScale, alignment: Alignment.center),
      child: CircleAvatar(
        backgroundImage: AssetImage(
            socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
        radius: 65.0,
      ),
    );
  }

  List<Widget> _formatApps() {
    List<Widget> appsUsed = List<Widget>();
    if (!widget.hasTwitterAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[0],
          widget.socialMediaLogos[0], widget.imageScales[0]));
    }
    if (!widget.hasFacebookAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[1],
          widget.socialMediaLogos[1], widget.imageScales[1]));
    }
    if (!widget.hasInstagramAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[2],
          widget.socialMediaLogos[2], widget.imageScales[2]));
    }
    return appsUsed;
  }

  Widget _displayApps() {
    if (!widget.hasTwitterAccount &&
        !widget.hasFacebookAccount &&
        !widget.hasInstagramAccount) {
      return Container(
        height: widget.screenHeight * 0.25,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _formatApps(),
        ),
      );
    } else if (widget.hasTwitterAccount &&
        widget.hasFacebookAccount &&
        widget.hasInstagramAccount) {
      return Container(
        height: widget.screenHeight * 0.25,
        width: double.infinity,
        child: Text(
          "All available apps have been added",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      );
    } else {
      return Container(
        height: widget.screenHeight * 0.25,
        width: widget.screenWidth * 0.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _formatApps(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
        title: Text(
          "Add Account",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Select App to Add",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(height: widget.screenHeight * 0.05, width: double.infinity),
          _displayApps(),
        ],
      ),
    );
  }
}

class LoginInfo {
  final String username;
  final String socialMediaName;
  final String imageName;

  LoginInfo(this.username, this.socialMediaName, this.imageName);
}

class AccountInfoScreen extends StatelessWidget {
  final LoginInfo accountInfo;

  AccountInfoScreen({Key key, @required this.accountInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${accountInfo.socialMediaName} Profile",
          style: TextStyle(
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
              size: screenWidth * 0.33,
            ),
          ),
          Padding(
            // padding: EdgeInsets.only(top: 40.0),
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              // Will need to replace the Username and Password with the one used by the actual User
              "Username: \n ${accountInfo.username} \n",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
