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

   final blueGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      colors.blueColor,
      colors.blueColor50,
    ],
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
    end: Alignment.centerRight,
    colors: [
      Color(0xffF3EBF9),
      Color(0xffFBF9FD),
    ],
  );


}

//static final gradients = AppGradients();