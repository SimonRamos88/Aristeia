import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_effects.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/deleteBloque.dart';
import 'package:flutter/material.dart';

class BlockCard extends StatelessWidget {
  static final colors = AppColors();
  static final gradients = AppGradients();
  static final effects = AppEffects();

  final void Function()? onTap;
  final bool myRoadmap;
  final String nombreBloque;
  final String descripcion;
  final int cantidadRecursos;
  final bool edit;
  final Function()? update;
  final String fechaInicio;
  final String fechaFin;
  final String? roadId;
  final String? blockId;

  const BlockCard({
    super.key,
    this.onTap,
    this.update,
    this.myRoadmap = false,
    this.nombreBloque = 'Nombre del bloque',
    this.descripcion = 'Soy la descripción del bloque',
    this.cantidadRecursos = 0, 
    this.fechaInicio = "-",
    this.fechaFin = "-",
    this.edit = false,
    this.roadId = '1',
    this.blockId = '1',
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
                     Text(descripcion,
                        softWrap: true,
                        style: bodyStyle.copyWith(color: Colors.black)),
                        const SizedBox(
                      height: 5,
                    ),
                    Text('${cantidadRecursos.toString()} recursos',
                        softWrap: true,
                        style: bodyStyle.copyWith(color: colors.blueColor, fontSize: 13, fontWeight: FontWeight.w500)),
                    myRoadmap
                        ? const SizedBox(
                      height: 8,
                    ): SizedBox(),
                    myRoadmap
                        ?  RichText(text: TextSpan(
                          text: 'Inicio: ',
                          style: subheadingbStyle.copyWith(
                                color: Theme.of(context).primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: fechaInicio,
                              style: subheadingStyle.copyWith(
                                color: Colors.black),
                            ),
                          ],
                        )): const SizedBox(height: 0, width: 0),
                    myRoadmap
                        ? const SizedBox(
                            height: 7,
                          )
                        : const SizedBox(height: 0, width: 0),
                    myRoadmap
                        ? RichText(text: TextSpan(
                          text: 'Fin: ',
                          style: subheadingbStyle.copyWith(
                                color: Theme.of(context).primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: fechaFin,
                              style: subheadingStyle.copyWith(
                                color: Colors.black),
                            ),
                          ],
                        )): const SizedBox(height: 0, width: 0),
                  ],
                ),
              ),
              myRoadmap
                  ? edit
                      ? IconButton(
                          // Alerta de eliminar bloque
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialogWidget(
                                color: 1,
                                message: '¿Estas seguro que deseas eliminar este bloque?',
                                leftText: 'Eliminar',
                                rightText: 'Cancelar',
                                onTapLeft: () {
                                  deleteBloque(roadId, blockId);
                                  Navigator.of(context).pop();
                                },
                                onTapRight: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: colors.blueColor,
                          ),
                        )
                      : StateWidget(estado:0)
                  : const SizedBox(height: 0, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
