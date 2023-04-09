import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppEffects {
  static final colors = AppColors();

  final mainShadow = const BoxShadow(
      color: Color.fromARGB(31, 35, 9, 39), // shadow color
      blurRadius: 4, // shadow radius
      offset: Offset(0, 4), // shadow offset
      spreadRadius:
          0, // The amount the box should be inflated prior to applying the blur
      blurStyle: BlurStyle.normal // set blur style
      );
}
