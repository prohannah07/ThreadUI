
import 'package:flutter/material.dart';
import '../../../../colorPallete/ThreadColorPallete.dart';

import './smPostCardUtilityWidgets/SMPostInteractions.dart';

class SMMoreDetailsPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userName;
  final String socialMedia;
  final String textPost;
  final bool media;
  final List imageURLs;

  SMMoreDetailsPage(
      {this.imagePath,
      this.name,
      this.userName,
      this.socialMedia,
      this.textPost,
      this.media,
      this.imageURLs});

  Widget _getUserImage() {
    return Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        // backgroundImage: AssetImage(imagePath),
        backgroundImage: AssetImage(imagePath),
        // backgroundImage: Image.network(imagePath),
        radius: 10.0,
      ),
    );
  }

  Widget _getUserName() {
    return Padding(
      padding: EdgeInsets.only(right: 2.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _getUserUsername() {
    return Text(
      "@" + userName,
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black38,
      ),
    );
  }

  _chooseSMColor() {
    if (socialMedia == "twitter") {
      return Colors.blue;
    } else if (socialMedia == "instagram") {
      return Colors.red[600];
    } else if (socialMedia == "facebook") {
      return Colors.blue[900];
    }
  }

  Widget _getUserSocialMedia() {
    return Image(
        image: AssetImage(
          "assets/socialMediaIcons/" + socialMedia + ".png",
        ),
        height: 15.0,
        width: 15.0,
        color: _chooseSMColor());
  }

  Widget _getUserTextPost(context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: textPost,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        // maxLines: 5,
        // overflow: TextOverflow.ellipsis,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
    );
  }

  Widget _buildUserDetails() {
    if (socialMedia == "facebook") {
      return Padding(
        padding: EdgeInsets.only(left: 4.0),
        child: Row(
          children: <Widget>[
            _getUserImage(),
            _getUserName(),
            _getUserSocialMedia()
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 4.0),
      child: Row(
        children: <Widget>[
          _getUserImage(),
          _getUserName(),
          _getUserUsername(),
          _getUserSocialMedia()
        ],
      ),
    );
  }

  Widget _buildPost(context) {
    return Column(
      children: <Widget>[
        _buildUserDetails(),
        _getUserTextPost(context),
        SMPostInteractions(
          socialMedia: socialMedia,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          socialMedia,
          style: TextStyle(fontSize: 14.0, color: ThreadColorPalette.red1),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ThreadColorPalette.red1),
      ),
      body: _buildPost(context),
    );
  }
}