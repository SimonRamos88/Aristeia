import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class Etiqueta extends StatelessWidget {

  static final gradients = AppGradients();
  
  final String text;
  final int size;


  const Etiqueta({
    required this.text, 
    this.size = 1});

  const Etiqueta.large({
    required this.text, 
    this.size = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (size==1)? const EdgeInsets.symmetric(horizontal: 8,vertical: 3):const EdgeInsets.symmetric(horizontal: 8,vertical: 4) ,
      //margin: (size==1)? const EdgeInsets.only(right: 4): null,
      alignment: (size==1)? Alignment.center : null,
      //height: (size==1)? 17:21,
      decoration: BoxDecoration(
        borderRadius: (size==1)?  BorderRadius.circular(18) : BorderRadius.circular(13.0),
        gradient: gradients.mainGradient,
      ),
      child:  Text(
          text,
          textAlign: TextAlign.center,
          style: (size==1)? subheadingStyle.copyWith(color: Colors.white): heading3Style.copyWith(color: Colors.white),
        ),
    );
  }
}
