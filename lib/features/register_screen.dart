import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? errorMessage = '';

  bool isLogin =true;

  final TextEditingController _controllerEmail =TextEditingController();

  final TextEditingController _controllerPassword =TextEditingController();

   Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
      context.router.push(const LoggedWrapperRoute());
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'registro',
        type: 1,
        onPressedLeading: () {
          context.router.push(const WelcomeRouter());
        },
      ),
      body: Column(
        children: [
          //InputField(hintText: 'Usuario', controller: _controllerEmail),
          // InputField(hintText: 'Nombre'),
          InputField(hintText: 'Correo', controller: _controllerEmail),
          InputField(hintText: 'Contraseña', isPassword: true,controller: _controllerPassword),
          // InputField(hintText: 'Confirmar contraseña', isPassword: true,),
          Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    errorMessage == '' ? '' : 'Hey... ? $errorMessage',
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  )),
          MyButton(
            buttonText: 'Registrarse',
             onTap: createUserWithEmailAndPassword,
            ),
            
        ],
      ),
    );
    ;
  }
}
