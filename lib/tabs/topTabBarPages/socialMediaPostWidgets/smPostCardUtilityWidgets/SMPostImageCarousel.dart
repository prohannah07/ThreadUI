import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import './SMPostOnTapCarousel.dart';

class SMPostImageCarousel extends StatelessWidget {
  final List imageURLs;

  SMPostImageCarousel({this.imageURLs});

  Widget _getCarousel() {
    return SizedBox(
      height: 175.0,
      width: 275.0,
      child: Carousel(
        images: 
          imageURLs.map((url) {
            return NetworkImage(url["photoURL"]);
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

  _onTap(context){
    print("Pictures");
  }

  _onTap2(context){
      Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            body: SMPostOnTapCarousel(imageURLs: imageURLs,)
          );
        },
      ),
    );
  }

  Widget _onTapGetCarousel(context){
    return GestureDetector(
      child: _getCarousel(),
      onTap: () => _onTap2(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.0),
      child: _onTapGetCarousel(context),
    );
  }
}
