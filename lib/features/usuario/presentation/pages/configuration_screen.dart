import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/features/usuario/domain/repositories/deleteUsuario.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/network/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

@RoutePage()
class ConfigurationScreen extends StatefulWidget {
  static final gradients = AppGradients();

  ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final TextEditingController _controllerPassword = TextEditingController();

  final TextEditingController _controllerConfPassword = TextEditingController();

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
            onTapLeft: () async {
              String? temp = Auth().currentUser?.uid;
              try {
                await deleteUsuariobyId(temp ?? '');
                await Auth().currentUser?.delete();
                context.router.replace(const WelcomeRouter());
              } on FirebaseAuthException catch (e) {
                print('No se pudo borrar el usuario...');
              }
            },
            rightText: 'Cancelar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  void cambiarContrasena() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        insetPadding: true,
        width: MediaQuery.of(context).size.width,
        tituloGeneral: false,
        tituloPersonalizado: Text(
          'Cambiar contraseña',
          style: heading2bStyle.copyWith(color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        //message: 'Si te sales sin guardar perderas toda la información del bloque',
        more: Column(
          children: [
            InputField(
                hintText: 'Contraseña',
                isPassword: true,
                controller: _controllerPassword),
            InputField(
                hintText: 'Confirmar',
                isPassword: true,
                controller: _controllerConfPassword),
          ],
        ),
        leftText: 'Cambiar',
        rightText: 'Cancelar',
        onTapLeft: () {
          if (_controllerConfPassword.text.trim() ==
              _controllerPassword.text.trim()) {
            print("Valido");
            Auth().currentUser?.updatePassword(_controllerPassword.text.trim());
            context.router.push(const WelcomeRouter());
          } else {
            print("Invalido");
          }
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              context.router.push(EditProfileRoute());
            },
          ),
          CajaOpcion(
            texto: 'Cambiar contraseña',
            onTap: cambiarContrasena,
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
