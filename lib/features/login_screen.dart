import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: 'Iniciar sesión',
          type: 1,
          onPressedLeading: () {
            context.router.push(const WelcomeRouter());
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/loginImage.png'),
            ),
            const SizedBox(
              width: 1,
              height: 24,
            ),
            InputField(hintText: 'Correo'),
            InputField(hintText: 'Contraseña', isPassword: true,),
            const SizedBox(
              width: 1,
              height: 16,
            ),
            MyButton(
              buttonText: 'Iniciar sesión',
            onTap: () {
                  context.router.push(const LoggedWrapperRoute());
                },
            ),
          
            const SizedBox(
              width: 1,
              height: 32,
            ),
            Text('¿Aún no tienes cuenta?', 
            style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor)),
            TextButton(onPressed: () {
              context.router.push(const RegisterRoute());
            }, child: Text('Regístrate aquí', style: heading3Style.copyWith(
              color: Theme.of(context).primaryColor,
               decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),),),
          ],
        ));
  }
}
