import 'package:flutter/material.dart';
import 'package:flutter_mobile_carousel/carousel.dart';
import 'package:flutter_mobile_carousel/carousel_arrow.dart';
import 'package:flutter_mobile_carousel/default_carousel_item.dart';
import 'package:flutter_mobile_carousel/types.dart';

import './SMPostDetails.dart';
import 'package:video_player/video_player.dart';
import './ChewieItem.dart';

class SMPostOnTapCarousel extends StatelessWidget {
  final List imageURLs;

  SMPostOnTapCarousel({this.imageURLs});

  List<Widget> _toList() {
    final children = <Widget>[];
    for (var i = 0; i < imageURLs.length; i++) {
      if (imageURLs[i]["type"] == "video") {
        children.add(ChewieListItem(
          videoPlayerController:
              VideoPlayerController.network(imageURLs[i]["videoURL"]),
          looping: true,
          aspectRatio: imageURLs[i]["aspectRatio"],
        ));
      } else {
        children.add(Image.network(imageURLs[i]["photoURL"], fit: BoxFit.fitWidth,));
      }
    }
    return children;
  }

  Widget _getCarousel(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: Carousel(
          rowCount: 1,
          children: _toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("value"),
      child: _getCarousel(context),
      direction: DismissDirection.vertical,
      onDismissed: (_) => Navigator.of(context).pop(),
    );
  }
}