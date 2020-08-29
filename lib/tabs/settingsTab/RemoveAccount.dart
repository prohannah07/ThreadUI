import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';

enum ConfirmSignOut { CANCEL, CONFIRM }

// ignore: must_be_immutable
class RemoveAccount extends StatefulWidget {
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

  RemoveAccount(
      {@required this.hasTwitterAccount,
      this.hasFacebookAccount,
      this.hasInstagramAccount,
      this.screenHeight,
      this.screenWidth,
      Key key})
      : super(key: key);

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  Future<ConfirmSignOut> _asyncConfirmDialog(
      BuildContext context,
      String socialMediaName,
      String socialMediaImagePath,
      double imageScale) async {
    return showDialog<ConfirmSignOut>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout', style: TextStyle(fontSize: 25.0)),
          content: _signoutContent(
              socialMediaName, socialMediaImagePath, imageScale),
          actions: <Widget>[
            FlatButton(
              child: const Text('NO',
                  style: TextStyle(
                      fontSize: 20,
                      color: ThreadColorPalette.red1,
                      fontWeight: FontWeight.w900)),
              onPressed: () {
                Navigator.of(context).pop(ConfirmSignOut.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('YES', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pop(ConfirmSignOut
                    .CONFIRM); // Will later be changed to redirect to logout
              },
            )
          ],
        );
      },
    );
  }

  Widget _signoutContent(
      String socialMediaName, String socialMediaImagePath, double imageScale) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: <Widget>[
          Text(
            'Are you sure you want to sign out of $socialMediaName?',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.04),
          CircleAvatar(
            backgroundImage: AssetImage(
                socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
            radius: widget.screenWidth * 0.16,
          ),
        ],
      ),
    );
  }

  Widget _socialMediaIconHandler(
      String socialMediaName, String socialMediaImagePath, double imageScale) {
    return GestureDetector(
      onTap: () => _asyncConfirmDialog(
          context, socialMediaName, socialMediaImagePath, imageScale),
      child: CircleAvatar(
        backgroundImage: AssetImage(
            socialMediaImagePath), //scale: imageScale, alignment: Alignment.center),
        radius: widget.screenWidth * 0.16,
      ),
    );
  }

  List<Widget> _formatApps() {
    List<Widget> appsUsed = List<Widget>();
    if (widget.hasTwitterAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[0],
          widget.socialMediaLogos[0], widget.imageScales[0]));
    }
    if (widget.hasFacebookAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[1],
          widget.socialMediaLogos[1], widget.imageScales[1]));
    }
    if (widget.hasInstagramAccount) {
      appsUsed.add(_socialMediaIconHandler(widget.accountNames[2],
          widget.socialMediaLogos[2], widget.imageScales[2]));
    }
    return appsUsed;
  }

  Widget _displayApps() {
    if (widget.hasTwitterAccount &&
        widget.hasFacebookAccount &&
        widget.hasInstagramAccount) {
      return Container(
        height: widget.screenHeight * 0.25,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _formatApps(),
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
          "Remove Account",
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
            "Select App to Remove",
            style: TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(height: 35, width: double.infinity),
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
              size: 135.0,
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
