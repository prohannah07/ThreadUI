import 'package:flutter/material.dart';

import '../../.././colorPallete/ThreadColorPallete.dart';
import 'smPostCardUtilityWidgets/SMPostDetails.dart';
import './smPostCardUtilityWidgets/SMPostImageCarousel.dart';

class SMPostCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userName;
  final String socialMedia;
  final String textPost;
  final bool media;

  SMPostCard({
    this.imagePath,
    this.name,
    this.userName,
    this.socialMedia,
    this.textPost,
    this.media,
  });

  void _onPostTap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: Text(
              socialMedia,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SMPostDetails(
        imagePath: imagePath,
        name: name,
        userName: userName,
        socialMedia: socialMedia,
        textPost: textPost,
        media: media,
      ),
      onTap: () => _onPostTap(context),
    );
  }
}
