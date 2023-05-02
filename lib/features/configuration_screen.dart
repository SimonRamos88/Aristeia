import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConfigurationScreen extends StatelessWidget {
  static final gradients = AppGradients();

  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void eliminarCuenta() {
      showDialog(
        context: context,
        builder: ((context) => AlertDialogWidget(
              message: '¿Estás seguro de que quieres eliminar tu cuenta?',
              more: Column(children: [
                Text(
                  '❗Si eliminas tu cuenta, perderás todo tu progreso y no podrás recuperarlo.',
                  style: interHeading3Style.copyWith(
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 12),
                Text(
                  '❗ Si quieres volver a usar RoadmapTo, tendrás que crear una nueva cuenta.',
                  style: interHeading3Style.copyWith(
                      color: Theme.of(context).colorScheme.primary),
                ),
              ]),
              leftText: 'Eliminar',
              onTapLeft: () {
                // Meter aqui funcion para eliminar cuenta
              },
              rightText: 'Cancelar',
              onTapRight: () {
                Navigator.of(context).pop();
              },
            )),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Configuración',
        type: 1,
        onPressedLeading: () {
          context.router.replace(LoggedWrapperRoute());
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CajaOpcion(
            texto: 'Editar datos',
            onTap: () {
              context.router.push(const EditProfileRoute());
            },
          ),
          const CajaOpcion(
            texto: 'Cambiar contraseña',
          ),
          const CajaOpcion(
            texto: 'Terminos y condiciones',
          ),
          const CajaOpcion(
            texto: 'Más sobre Aristeia',
          ),
          CajaOpcion(
            texto: 'Eliminar Cuenta',
            onTap: eliminarCuenta,
          ),
        ]),
      ),
    );
  }
}

class CajaOpcion extends StatelessWidget {
  final String texto;
  final Function()? onTap;

  const CajaOpcion({super.key, this.onTap, this.texto = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Text(
          texto,
          style: heading3bStyle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
