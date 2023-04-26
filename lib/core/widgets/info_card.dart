import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  static final gradients = AppGradients();

  final Widget child;

  const InfoCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: gradients.infoGradient,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(31, 35, 9, 39), // shadow color
                blurRadius: 4, // shadow radius
                offset: Offset(0, 4), // shadow offset
                spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                blurStyle: BlurStyle.normal // set blur style
                ),
          ],
        ),
        child: child,
      
    );
  }
}
