import 'package:aristeia_app/core/utils/app_effects.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/etiqueta.dart';
import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {
  static final gradients = AppGradients();
  static final effects = AppEffects();

  const RoadmapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          gradient: gradients.cardGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [effects.mainShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nombre del roadmap',
                  style: heading3bStyle.copyWith(
                      color: Theme.of(context).primaryColor),
                ),
                Text('Estado')
              ],
            ),
            const SizedBox(
              width: 1,
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Descripción del roadmap',
                  style: bodyStyle.copyWith(color: Colors.black),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '16',
                      style: bodyStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      'Bloques',
                      style: bodyStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 1,
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                  Row(
                    children: [
                    Etiqueta(text: 'etiqueta 1'),
                    SizedBox(width: 4,),
                    Etiqueta(text: 'etiqueta 1'),
                    SizedBox(width: 4,),
                    Etiqueta(text: 'etiqueta 1'),
                  ]),
                Row(
                  children: const [
                    Icon(
                      Icons.star_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    Text('4,3'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
