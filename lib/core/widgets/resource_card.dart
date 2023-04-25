import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_effects.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  static final colors = AppColors();
  static final gradients = AppGradients();
  static final effects = AppEffects();

  final void Function()? onTap;
  final bool myRoadmap;
  final String nombreRecurso;
  final String descripcion;
  final bool edit;
  final void Function()? onDelete;

  const ResourceCard({
    super.key,
    this.onTap,
    this.onDelete,
    this.myRoadmap = true,
    this.nombreRecurso = 'Nombre del recurso',
    this.descripcion = '',
    this.edit = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: gradients.pinkcardGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [effects.mainShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        nombreRecurso,
                        softWrap: true,
                        style:
                            heading3bStyle.copyWith(color: colors.pinkColor)),
                    const SizedBox(
                      height: 5,
                    ),
                    myRoadmap
                        ? RichText(
                            text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Creador: ',
                                style: subheadingbStyle.copyWith(
                                    color: colors.pinkColor),),
                                    TextSpan(
                                text: 'Simon ramos',
                                style: bodyStyle.copyWith(
                                    color: Colors.black),),
                            ],
                          ))
                        : const SizedBox(height: 0, width: 0),
                    (descripcion != '')
                        ? const SizedBox(
                            height: 5,
                          )
                        : const SizedBox(height: 0, width: 0),
                    (descripcion != '')
                        ? Text('yo soy la descripcion xdddd',
                            softWrap: true,
                            style: bodyStyle.copyWith(
                                color: Colors.black))
                        : const SizedBox(height: 0, width: 0),
                                            const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              edit
                  ? IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        size: 24,
                        color: colors.blueColor,
                      ),
                    )
                  : const SizedBox(height: 0, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
