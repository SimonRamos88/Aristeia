import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_effects.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BlockCard extends StatelessWidget {
  static final colors = AppColors();
  static final gradients = AppGradients();
  static final effects = AppEffects();

  final void Function()? onTap;
  final bool myRoadmap;
  final String nombreBloque;
  final int cantidadRecursos;
  final bool edit;
  final Function()? onDelete;
  final Function()? update;
  final String fechaInicio;
  final String fechaFin;

  const BlockCard({
    super.key,
    this.onTap,
    this.onDelete,
    this.update,
    this.myRoadmap = true,
    this.nombreBloque = 'Nombre del bloque',
    this.fechaInicio = "2000/00/00",
    this.fechaFin = "2000/00/00",
    this.cantidadRecursos = 0, 
    this.edit = true,
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
            gradient: gradients.bluecardGradient,
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
                        nombreBloque,
                        softWrap: true,
                        style:
                            heading3bStyle.copyWith(color: colors.blueColor)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${cantidadRecursos.toString()} recursos',
                        softWrap: true,
                        style: bodyStyle.copyWith(color: Colors.black)),
                    const SizedBox(
                      height: 5,
                    ),
                    myRoadmap
                        ? Text('Inicio: ' + fechaInicio,
                            softWrap: true,
                            style: subheadingbStyle.copyWith(
                                color: Theme.of(context).primaryColor))
                        : const SizedBox(height: 0, width: 0),
                    myRoadmap
                        ? const SizedBox(
                            height: 5,
                          )
                        : const SizedBox(height: 0, width: 0),
                    myRoadmap
                        ? Text('Fin: ' + fechaFin,
                            softWrap: true,
                            style: subheadingbStyle.copyWith(
                                color: Theme.of(context).primaryColor))
                        : const SizedBox(height: 0, width: 0),
                  ],
                ),
              ),
              myRoadmap
                  ? edit
                      ? IconButton(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete,
                            size: 24,
                            color: colors.blueColor,
                          ),
                        )
                      : Text('estado',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: subheadingbStyle.copyWith(
                              color: Theme.of(context).primaryColor))
                  : const SizedBox(height: 0, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
