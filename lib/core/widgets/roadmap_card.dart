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
    this.descripcionRoadmap = 'Descripción del roadmapd ',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  Expanded(
                    child: Text(
                      softWrap:true,
                      maxLines:2,
                      overflow: TextOverflow.ellipsis,
                      nombreRoadmap,
                      style: heading3bStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  myRoadmap
                      ? const StateWidget()
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
                  Expanded(
                    child: Text(
                      softWrap:true,
                      maxLines:4,
                      overflow: TextOverflow.ellipsis,
                      descripcionRoadmap,
                      style: bodyStyle.copyWith(color: Colors.black),
                    ),
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
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                        for (var i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Etiqueta(
                            text: 'etiqueta $i',
                          ), ),
                         
                      ]),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 24,
                        color: colors.mainColor,
                      ),
                      Text(
                        '4,3',
                        style: heading3bStyle.copyWith(color: colors.mainColor),
                      ),
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
