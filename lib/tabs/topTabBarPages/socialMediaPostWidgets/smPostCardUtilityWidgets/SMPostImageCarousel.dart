import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class SMPostImageCarousel extends StatelessWidget {
  final List<String> imageURLs;

  SMPostImageCarousel({this.imageURLs});

  Widget _getCarousel() {
    return SizedBox(
      height: 175.0,
      width: 275.0,
      child: Carousel(
        images: 
          imageURLs.map((url) {
            return NetworkImage(url);
          }).toList(),
        dotSize: 5.0,
        dotIncreaseSize: 2,
        dotSpacing: 7.0,
        dotColor: Colors.white24,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.purple.withOpacity(0),
        borderRadius: true,
        autoplay: false,
      ),
    );
  }

  _onTap(){
    print("Pictures");
  }

  Widget _onTapGetCarousel(){
    return GestureDetector(
      child: _getCarousel(),
      onTap: _onTap
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0),
      child: _onTapGetCarousel(),
    );
  }
}
