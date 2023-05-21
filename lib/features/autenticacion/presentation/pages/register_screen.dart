// import 'dart:ffi';
// import 'dart:io';

import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/features/autenticacion/presentation/pages/terms_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isToastShown = false;
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerUsertag = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfPassword = TextEditingController();
  //Crear usuario
  Future<void> createUserWithEmailAndPassword() async {
    if (passwordConfirmed() == true) {
      try {
        await Auth().createUserWithEmailAndPassword(
            email: _controllerEmail.text, password: _controllerPassword.text);
        await Auth().currentUser?.sendEmailVerification();
        await sendUserData();
        context.router.push(LoginRoute());
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        errorMessage = 'Las contraseñas no coinciden';
      });
    }
  }

  Future<void> sendUserData() async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(Auth().currentUser?.uid)
        .set({
      "usertag": _controllerUsertag.text.trim(),
      "nombres": _controllerName.text.trim(),
    });

    // ignore: use_build_context_synchronously
    context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 5),
      builder: (context, controller) => FlashBar(
        controller: controller,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.bottom,
        indicatorColor: Theme.of(context).primaryColor,
        icon: const Icon(Icons.check),
        //title: const Text('Flash Title'),
        content: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Cuenta creada exitosamente, por favor revisa tu correo para poder verificar tu cuenta',
              textAlign: TextAlign.center,
              style: heading3bStyle,
            )),
      ),
    );

    print("Operacion exitosa");
  }

  bool passwordConfirmed() {
    if (_controllerPassword.text.trim() ==
        _controllerConfPassword.text.trim()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Registro',
        type: 1,
        onPressedLeading: () {
          context.router.push(const WelcomeRouter());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(hintText: 'Usuario', controller: _controllerUsertag),
            InputField(
              hintText: 'Nombre',
              controller: _controllerName,
            ),
            InputField(hintText: 'Correo', controller: _controllerEmail),
            InputField(
                hintText: 'Contraseña',
                isPassword: true,
                controller: _controllerPassword),
            InputField(
              hintText: 'Confirmar contraseña',
              isPassword: true,
              controller: _controllerConfPassword,
            ),
            errorMessage != '' ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  errorMessage == '' ? '' : 'Algo salió mal... $errorMessage',
                  style: bodyStyle,
                  textAlign: TextAlign.center,
                )): SizedBox(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Recuerda que al registrarte aceptas nuestros términos y condiciones',
                style: heading3Style,
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsScreen()),
                  );
                },
                child: Text(
                  'Ver términos y condiciones',
                  style:
                      heading3Style.copyWith(color: Theme.of(context).primaryColor,decoration: TextDecoration.underline ),
                  textAlign: TextAlign.center,
                )),
            MyButton(
              buttonText: 'Registrarse',
              onTap: () {
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
