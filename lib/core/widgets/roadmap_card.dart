import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_effects.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/etiqueta.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {

static final colors = AppColors();

  static final gradients = AppGradients();
  static final effects = AppEffects();
  final void Function()? onTap;
  final bool myRoadmap;
  final String nombreRoadmap;
  final String descripcionRoadmap;

  const RoadmapCard({
    super.key,
    this.onTap,
    this.myRoadmap = false,
    this.nombreRoadmap = 'Nombre del roadmap',
    this.descripcionRoadmap = 'Descripción del roadmap',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                    nombreRoadmap,
                    style: heading3bStyle.copyWith(
                        color: Theme.of(context).primaryColor),
                  ),
                  myRoadmap
                      ? StateWidget()
                      : const SizedBox(
                          width: 0,
                          height: 0,
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
                  Text(
                    descripcionRoadmap,
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
                  Row(children: [
                    Etiqueta(text: 'etiqueta 1'),
                    SizedBox(
                      width: 4,
                    ),
                    Etiqueta(text: 'etiqueta 1'),
                    SizedBox(
                      width: 4,
                    ),
                    Etiqueta(text: 'etiqueta 1'),
                  ]),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 24,
                        color: colors.mainColor,
                      ),
                      Text('4,3', style: heading3bStyle.copyWith(color: colors.mainColor),),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
