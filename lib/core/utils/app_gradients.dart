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


}
