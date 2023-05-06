import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/features/usuario/domain/repositories/deleteUsuario.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/network/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

@RoutePage()
class ConfigurationScreen extends StatelessWidget {
  static final gradients = AppGradients();

  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerPassword =TextEditingController();
    final TextEditingController _controllerConfPassword =TextEditingController();
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
          CajaOpcion(
            texto: 'Cambiar contraseña',onTap: () {
            showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                title: Text('Ingresa tu nueva contraseña :'),
                content: Column(
                  children: [
                    InputField(hintText: 'Contraseña', isPassword:true,controller:_controllerPassword ),
                    InputField(hintText:'Confirmar' , isPassword: true,controller: _controllerConfPassword),
                    ElevatedButton(onPressed: (){
                      if(_controllerConfPassword.text.trim()==_controllerPassword.text.trim()){
                        print("Valido");
                        Auth().currentUser?.updatePassword(_controllerPassword.text.trim());
                        context.router.push(const WelcomeRouter());
                      }
                      else{
                        print("Invalido");
                      }
                    }, child: Text("Enviar"),
                      style: const ButtonStyle(

                      ),
                    )
                    ,
                    Text("en cuanto envies la solicitud deberas iniciar sesion de nuevo")
                  ],


                ),

              )),
            );
          },
          ),
          const CajaOpcion(
            texto: 'Terminos y condiciones',
          ),
          const CajaOpcion(
            texto: 'Más sobre Aristeia',
          ),
          CajaOpcion(
            texto: 'Eliminar Cuenta',
            onTap: () {
              showDialog(
                context: context,
                builder: ((context) => AlertDialogWidget(
                      message: '¿Estás seguro de que quieres eliminar tu cuenta?',
                      leftText: 'Eliminar',
                      onTapLeft: () async {
                        String? temp=Auth().currentUser?.uid;
                        try{
                          await deleteUsuariobyId(temp ?? '');
                          await Auth().currentUser?.delete();
                          context.router.replace(const WelcomeRouter());
                        } on FirebaseAuthException catch (e){
                          print('No se pudo borrar el usuario...');
                        }


                      },
                      rightText: 'Cancelar',
                      onTapRight: () {
                        Navigator.of(context).pop();
                      },
                    )),
              );
            },
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
