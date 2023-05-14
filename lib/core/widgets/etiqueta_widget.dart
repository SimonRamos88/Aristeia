import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class Etiqueta extends StatelessWidget {

  static final gradients = AppGradients();
  
  final String text;
  final int size;
  final int color;


  const Etiqueta({
    super.key, 
    required this.text, 
    this.size = 1,
    this.color = 0,
    });

  const Etiqueta.large({
    super.key, 
    required this.text, 
    this.size = 2,
    this.color = 0,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (size==1)? const EdgeInsets.symmetric(horizontal: 8,vertical: 3):const EdgeInsets.symmetric(horizontal: 12,vertical: 5) ,
      //margin: (size==1)? const EdgeInsets.only(right: 4): null,
      alignment: (size==1)? Alignment.center : null,
      //height: (size==1)? 17:21,
      decoration: BoxDecoration(
        borderRadius: (size==1)?  BorderRadius.circular(18) : BorderRadius.circular(13.0),
        gradient: color==0? gradients.mainLabelGradient: gradients.mainBlueGradient,
      ),
      child:  Text(
          text,
          textAlign: TextAlign.center,
          style: (size==1)? subheadingStyle.copyWith(color: Colors.white): heading3Style.copyWith(color: Colors.white),
        ),
    );
  }
}
