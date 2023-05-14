  import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:flutter/material.dart';

void cambiarEstado(context) {

    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: 'Cambiar el estado del bloque',
            more: Column(
              children: const [
                StateWidget(
                  large: true,
                  estado: 0,
                ),
                SizedBox(
                  height: 16,
                ),
                StateWidget(
                  large: true,
                  estado: 1,
                ),
                SizedBox(
                  height: 16,
                ),
                StateWidget(
                  large: true,
                  estado: 2,
                )
              ],
            ),
            rightText: 'Cancelar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }