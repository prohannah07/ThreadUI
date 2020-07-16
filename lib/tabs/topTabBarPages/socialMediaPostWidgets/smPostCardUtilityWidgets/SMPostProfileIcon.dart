import 'package:flutter/material.dart';

class SMPostProfileIcon extends StatelessWidget {
  final String imagePath;

  SMPostProfileIcon({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}