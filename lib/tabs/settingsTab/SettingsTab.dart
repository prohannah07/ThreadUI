import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../.././colorPallete/ThreadColorPallete.dart';
import 'ManageMyAccountsTab.dart';
import 'PrivacyAndSecurity.dart';
import 'TermsAndServices.dart';
import 'AboutPage.dart';

class SettingsTab extends StatefulWidget {
  final changeLoginStatus;
  final returnLoginStatus;

  SettingsTab({Key key, this.changeLoginStatus, this.returnLoginStatus})
      : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ThreadColorPalette.red2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15.0),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Manage My Accounts"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageMyAccounts(
                                  changeLoginStatus: widget.changeLoginStatus,
                                  returnLoginStatus: widget.returnLoginStatus,
                                ))),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Privacy and Security"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyAndSecurity())),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text("Terms and Services"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndServices())),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutPage())),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
