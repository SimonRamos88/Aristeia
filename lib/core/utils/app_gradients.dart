import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static final colors = AppColors();

  final mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      colors.mainColor,
      colors.mainColor50,
    ],
  );

  final mainBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xff4650FA),
      Color.fromARGB(255, 161, 166, 255),
    ],
  );

  final blueGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff4650FA),
      Color.fromRGBO(70, 80, 250, 0.7),
      Color.fromRGBO(70, 80, 250, 0),
    ],
    stops: [0.0, 0.9323, 1.0],
  );

  final pinkGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffC743F0),
      Color.fromARGB(122, 200, 67, 240),
      Color.fromARGB(44, 200, 67, 240),
    ],
    stops: [0.0, 0.9323, 1.0],
  );

  final infoGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffEEEAFC),
      Color(0xffFCFCFF),
    ],
  );

  final cardGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.center,
    colors: [
      Color.fromARGB(255, 242, 230, 252),
      Color.fromARGB(255, 250, 245, 255),
    ],
  );

  final bluecardGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.center,
    colors: [
      Color.fromARGB(255, 224, 225, 255),
      Color.fromARGB(255, 245, 245, 255),
    ],
  );

  final pinkcardGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.center,
    colors: [
      Color.fromARGB(255, 247, 221, 255),
      Color.fromARGB(255, 253, 245, 255),
    ],
  );

  final mainLabelGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff6D4CE4),
      Color(0xB56D4CE4),
      Color(0x7D6D4CE4),
    ],
    stops: [0.0, 0.9323, 1.0],
  );
}

//static final gradients = AppGradients();