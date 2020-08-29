import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../colorPallete/ThreadColorPallete.dart';
import 'RemoveAccount.dart';
import 'AddAccount.dart';

// ignore: must_be_immutable
class ManageMyAccounts extends StatelessWidget {
  bool hasTwitterAccount = true;
  bool hasFacebookAccount = true;
  bool hasInstagramAccount = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool _loggedIntoAllAccounts =
        (hasTwitterAccount && hasFacebookAccount && hasInstagramAccount);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage My Accounts",
          style: TextStyle(
            fontSize: 28,
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
                      //leading: Icon(Icons.add),
                      title: Text("Add Account"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      enabled: !_loggedIntoAllAccounts,
                      onTap: () {
                        if (!_loggedIntoAllAccounts) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAccount(
                                        hasTwitterAccount: hasTwitterAccount,
                                        hasFacebookAccount: hasFacebookAccount,
                                        hasInstagramAccount:
                                            hasInstagramAccount,
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                      )));
                        }
                      }),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  ListTile(
                    //leading: Icon(Icons.remove),
                    title: Text("Remove Account"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RemoveAccount(
                                  hasTwitterAccount: hasTwitterAccount,
                                  hasFacebookAccount: hasFacebookAccount,
                                  hasInstagramAccount: hasInstagramAccount,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
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
                ]))
          ],
        ),
      ),
    );
  }
}
