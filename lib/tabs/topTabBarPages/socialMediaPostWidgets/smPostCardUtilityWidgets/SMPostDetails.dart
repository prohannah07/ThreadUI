import 'package:flutter/material.dart';

import 'SMPostProfileIcon.dart';
import './SMPostImageCarousel.dart';

class SMPostDetails extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userName;
  final String socialMedia;
  final String textPost;

  SMPostDetails(
      {this.imagePath,
      this.name,
      this.userName,
      this.socialMedia,
      this.textPost});

  Widget _userName() {
    return Text(
      name,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userUserName() {
    return Padding(
      padding: EdgeInsets.only(left: 3.0, right: 2.0, bottom: 4.0),
      child: Text(
        "@" + userName,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _userSocialMedia() {
    return Image(
        image: AssetImage(
          "assets/socialMediaIcons/" + socialMedia + ".png",
        ),
        height: 15.0,
        width: 15.0,
        color: Colors.blue
      );
  }

  Widget _userTextPost() {
    return Container(
      child: RichText(
        text: TextSpan(
          text: textPost,
          style: TextStyle(color: Colors.black),
        ),
        maxLines: 5,
      ),
      width: 280.0,
    );
  }

  Widget _buildUserNameInfo() {
    return Row(
      children: [
        _userName(),
        _userUserName(),
        _userSocialMedia(),
      ],
    );
  }

  Widget _buildUserNameInfoAndPost() {
    return Container(
      padding: EdgeInsets.only(left: 7.0),
      child: Column(
        children: [
          _buildUserNameInfo(),
          _userTextPost(),
          SMPostImageCarousel()
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        child: Row(
          children: <Widget>[
            SMPostProfileIcon(imagePath: imagePath),
            // _buildUserNameInfo(),
            _buildUserNameInfoAndPost(),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
