import 'package:flutter/material.dart';
import 'package:flutter_mobile_carousel/carousel.dart';
import 'package:flutter_mobile_carousel/carousel_arrow.dart';
import 'package:flutter_mobile_carousel/default_carousel_item.dart';
import 'package:flutter_mobile_carousel/types.dart';

class SMPostOnTapCarousel extends StatelessWidget {
  final List<String> imageURLs;

  SMPostOnTapCarousel({this.imageURLs});

  List<Widget> _toList() {
    final children = <Widget>[];
    for (var i = 0; i < imageURLs.length; i++) {
      children.add(Image.network(imageURLs[i]));
    }
    return children;
  }

  Widget _getCarousel(context){
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

  void _onDismiss(){
    // Navigator.of(context).pop();
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _getCarousel(context),
    );
  }
}
