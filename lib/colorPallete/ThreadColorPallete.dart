import 'package:flutter/material.dart';

class ThreadColorPalette {
  ThreadColorPalette._();

  static const Map<int, Color> _colorRed1 =
  {
    50:Color.fromRGBO(255,71,71, .1),
    100:Color.fromRGBO(255,71,71, .2),
    200:Color.fromRGBO(255,71,71, .3),
    300:Color.fromRGBO(255,71,71, .4),
    400:Color.fromRGBO(255,71,71, .5),
    500:Color.fromRGBO(255,71,71, .6),
    600:Color.fromRGBO(255,71,71, .7),
    700:Color.fromRGBO(255,71,71, .8),
    800:Color.fromRGBO(255,71,71, .9),
    900:Color.fromRGBO(255,71,71, 1),
  };

  static const MaterialColor red1 = MaterialColor(0xFFFF4747, _colorRed1);

    static const Map<int, Color> _colorRed2 =
  {
    50:Color.fromRGBO(143,0,0, .1),
    100:Color.fromRGBO(143,0,0, .2),
    200:Color.fromRGBO(143,0,0, .3),
    300:Color.fromRGBO(143,0,0, .4),
    400:Color.fromRGBO(143,0,0, .5),
    500:Color.fromRGBO(143,0,0, .6),
    600:Color.fromRGBO(143,0,0, .7),
    700:Color.fromRGBO(143,0,0, .8),
    800:Color.fromRGBO(143,0,0, .9),
    900:Color.fromRGBO(143,0,0, 1),
  };

  static const MaterialColor red2 = MaterialColor(0xFF8F0000, _colorRed2);
}