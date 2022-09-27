import 'package:cep/core/color/hex_color.dart';
import 'package:flutter/material.dart';

  Map<int, Color> _swatchOpacity = {
    50: const Color.fromRGBO(250,226,116, .1),
    100: const Color.fromRGBO(250,226,116, .2),
    200: const Color.fromRGBO(250,226,116, .3),
    300: const Color.fromRGBO(250,226,116, .4),
    400: const Color.fromRGBO(250,226,116, .5),
    500: const Color.fromRGBO(250,226,116, .6),
    600: const Color.fromRGBO(250,226,116, .7),
    700: const Color.fromRGBO(250,226,116, .8),
    800: const Color.fromRGBO(250,226,116, .9),
    900: const Color.fromRGBO(250,226,116, 1),
  };

abstract class CustomColors {



  static MaterialColor customSwatchColor = MaterialColor(0xFFFFFDE7, _swatchOpacity);
}