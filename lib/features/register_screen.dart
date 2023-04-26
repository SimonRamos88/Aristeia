// import 'dart:ffi';
// import 'dart:io';

import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@RoutePage()

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail =TextEditingController();
  final TextEditingController _controllerUsertag =TextEditingController();
  final TextEditingController _controllerName =TextEditingController();
  final TextEditingController _controllerPassword =TextEditingController();
  final TextEditingController _controllerConfPassword =TextEditingController();
  //Crear usuario
   Future<void> createUserWithEmailAndPassword() async {
     if (passwordConfirmed() == true) {
     try {
       await Auth().createUserWithEmailAndPassword(
           email: _controllerEmail.text,
           password: _controllerPassword.text
       );
       await sendUserData();
       context.router.push(const LoggedWrapperRoute());
     } on FirebaseAuthException 
     catch (e) {
       setState(() {
           errorMessage = e.message;
       });
     }
   }else{
    setState(() {
           errorMessage = 'La contraseñas no coinciden';
       });
   }
     
  }

  Future<void> sendUserData() async {
     await FirebaseFirestore.instance.collection('usuarios').doc(Auth().currentUser?.uid).set({
       "usertag": _controllerUsertag.text.trim(),
       "nombres": _controllerName.text.trim(),});
     print("Operacion exitosa");
  }
  bool passwordConfirmed(){
     if(_controllerPassword.text.trim()==_controllerConfPassword.text.trim()){
       return true;
     }
     return false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(hintText: 'Usuario',controller: _controllerUsertag),
            InputField(hintText: 'Nombre',controller: _controllerName,),
            InputField(hintText: 'Correo', controller: _controllerEmail),
            InputField(hintText: 'Contraseña', isPassword: true,controller: _controllerPassword),
            InputField(hintText: 'Confirmar contraseña', isPassword: true, controller: _controllerConfPassword,),
            Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      errorMessage == '' ? '' : 'Algo salió mal... $errorMessage',
                      style: bodyStyle,
                      textAlign: TextAlign.center,
                    )),
            MyButton(
              buttonText: 'Registrarse',
               onTap: (){
                 createUserWithEmailAndPassword();
      
                },
              ),
      
          ],
        ),
      ),
    );
    ;
  }
}
