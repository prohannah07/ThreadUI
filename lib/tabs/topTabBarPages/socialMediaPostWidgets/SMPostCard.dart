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

  SMPostCard(
      {this.imagePath,
      this.name,
      this.userName,
      this.socialMedia,
      this.textPost});

  @override
  Widget build(BuildContext context) {
    return SMPostDetails(
      imagePath: imagePath,
      name: name,
      userName: userName,
      socialMedia: socialMedia,
      textPost: textPost,
    );
  }
}
