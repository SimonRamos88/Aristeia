
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aristeia_app/core/network/auth.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {



  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {

    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
          context.router.replace(const LoggedWrapperRoute());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 1,
                height: 24,
              ),
              const Image(
                image: AssetImage('assets/images/loginImage.png'),
              ),
              const SizedBox(
                width: 1,
                height: 32,
              ),
              InputField(
                hintText: 'Correo',
                controller: _controllerEmail,
              ),
              InputField(
                hintText: 'Contraseña',
                isPassword: true,
                controller: _controllerPassword,
              ),
              const SizedBox(
                width: 1,
                height: 8,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    errorMessage == '' ? '' : 'Hey... ? $errorMessage',
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                width: 1,
                height: 8,
              ),
              MyButton(
                buttonText: 'Iniciar sesión',
                onTap: signInWithEmailAndPassword
                //context.router.push(const LoggedWrapperRoute());
                ,
              ),
              const SizedBox(
                width: 1,
                height: 32,
              ),
              Text('¿Aún no tienes cuenta?',
                  style: heading3bStyle.copyWith(
                      color: Theme.of(context).primaryColor)),
              TextButton(
                onPressed: () {
                  context.router.push(RegisterRoute());
                },
                child: Text(
                  'Regístrate aquí',
                  style: heading3Style.copyWith(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
