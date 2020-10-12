import 'package:flutter/material.dart';

import '../../../../colorPallete/ThreadColorPallete.dart';
import 'smPostCardUtilityWidgets/SMPostDetails.dart';
import './SMMoreDetailsPage.dart';

class SMPostCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userName;
  final String socialMedia;
  final String textPost;
  final bool media;
  final List imageURLs;
  final String tweetId;
  final bool verified;

  SMPostCard({
    this.imagePath,
    this.name,
    this.userName,
    this.socialMedia,
    this.textPost,
    this.media,
    this.imageURLs,
    this.tweetId,
    this.verified
  });

  void _onPostTap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: SMMoreDetailsPage(
              imagePath: imagePath,
              name: name,
              userName: userName,
              socialMedia: socialMedia,
              textPost: textPost,
              media: media,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: SMPostDetails(
          imagePath: imagePath,
          name: name,
          userName: userName,
          socialMedia: socialMedia,
          textPost: textPost,
          media: media,
          imageURLs: imageURLs,
          tweetId: tweetId,
          verified: verified,
        ),
        width: MediaQuery.of(context).size.width,
        color: Colors.white54,
      ),
      onTap: () => _onPostTap(context),
    );
  }
}