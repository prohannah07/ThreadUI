import 'package:flutter/material.dart';

import './SMPostImageCarousel.dart';
import './SMPostInteractions.dart';

class SMPostDetails extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userName;
  final String socialMedia;
  final String textPost;
  final bool media;
  final List imageURLs;

  SMPostDetails({
    this.imagePath,
    this.name,
    this.userName,
    this.socialMedia,
    this.textPost,
    this.media,
    this.imageURLs
  });

  Widget _getUserImage() {
    return Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        // backgroundImage: AssetImage(imagePath),
        backgroundImage: NetworkImage(imagePath),
        radius: 25.0,
      ),
    );
  }

  Widget _getUserName() {
    var nameLen = name.length;
    var finalName = name;
    if (nameLen > 10){
      finalName = name.substring(0,10) + "...";
    }
    return Padding(
      padding: EdgeInsets.only(right: 2.0),
      child: Text(
        finalName,
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

  Widget _getUserTextPost() {
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
      width: 280.0,
    );
  }

  Widget _buildUserNames() {
    if (socialMedia == "facebook") {
      return Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: Row(
          children: <Widget>[
            _getUserName(),
            _getUserSocialMedia(),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Row(
        children: <Widget>[
          _getUserName(),
          _getUserUsername(),
          _getUserSocialMedia(),
        ],
      ),
    );
  }

  Widget _buildUserNamesAndPostDetails() {
    if (media) {
      return Column(
        children: <Widget>[
          _buildUserNames(),
          _getUserTextPost(),
          SMPostImageCarousel(imageURLs: imageURLs),
          SMPostInteractions(socialMedia: socialMedia)
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      );
    }
    return Column(
      children: <Widget>[
        _buildUserNames(),
        _getUserTextPost(),
        SMPostInteractions(socialMedia: socialMedia,)
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _buildUserPost() {
    return Row(
      children: <Widget>[
        _getUserImage(),
        _buildUserNamesAndPostDetails(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildUserPost(),
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      // color: Colors.blue[100],
    );
  }
}
