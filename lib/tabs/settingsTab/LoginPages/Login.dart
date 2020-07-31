import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../.././colorPallete/ThreadColorPallete.dart';

class AccountLogin extends StatefulWidget{
  @override
  _AccountLoginState createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLogin>{
  // final _formUsername = GlobalKey<FormState>();
  final _formPassword = GlobalKey<FormState>();

  Widget _inputUsernameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "Username or Email",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                //contentPadding: EdgeInsets.only(top: 15.0),
                hintText: "Enter your Username or Email",
              ),
            ),
          ),
        ],
    );
  }

    Widget _inputPasswordField(){
    return Form(
        key: _formPassword, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.centerLeft,
                height: 50.0,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    hintText: "Enter Password",
                  ),
                  validator: (value) {
                    if (value.isEmpty){
                      return 'Incorrect Password or Username';
                    }
                    return null;
                  },
                ),
              ),
            ],
        ),
      );
  }

  Widget _loginButton(){
    return ButtonTheme(
        minWidth: 200.0,
        height: 50.0,
        child: RaisedButton(
          onPressed: (){
            if (_formPassword.currentState.validate()){
              print("Password entry is not empty: $_formPassword");
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black),
          ),
          textColor: Colors.black,
          color: ThreadColorPalette.red1,
          padding: const EdgeInsets.all(0.0),
          child: const Text(
            "Login",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      );
  }

  Widget _loginBox(){
    return Container(
          alignment: Alignment.center,
          height: 450,
          width: 360,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 35, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                _inputUsernameField(),
                SizedBox(height: 30.0),
                _inputPasswordField(),
                SizedBox(height: 30.0),
                _loginButton(),
              ],
            ),
          ),
        );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Login",
          style:
            TextStyle(fontSize: 27, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        backgroundColor: ThreadColorPalette.red2,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Padding(
               padding: EdgeInsets.all(10.0),
               child: Container(
                 alignment: Alignment.topCenter,
                 // Image will change according to which social media account the user logs in to
                 child: Image.asset("assets/socialMediaIcons/png/twitter.png", scale: 2.0, alignment: Alignment.topCenter),
               ),
             ),
            _loginBox(),
          ],
        ),
      ),
    );
  }
}
