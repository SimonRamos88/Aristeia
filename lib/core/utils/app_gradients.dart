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

  final pinkGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      colors.pinkColor,
      colors.pinkColor50,
    ],
  );

  final infoGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffEEEAFC),
      Color(0xffFCFCFF),
    ],
  );

  final cardGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.center,
    colors: [
      Color(0xffF3EBF9),
      Color(0xffFBF9FD),
    ],
  );
}

//static final gradients = AppGradients();