import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/widgets/but.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_gradients.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static final colors = AppColors();
  static final gradients = AppGradients();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 1,
              height: MediaQuery.of(context).size.height/6,
            ),
            const Image(image: AssetImage('assets/images/welcomeImage.png')),
            const SizedBox(
              width: 1,
              height: 16,
            ),
            Text(
              'RoadmapTo',
              style: TextStyle(
                color: colors.mainColor,
                fontSize: 50,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 1,
              height: 24,
            ),
             MyButton(
              buttonText: "Iniciar sesión",
              onTap: () {
                  context.router.push(LoginRoute());
                },
            ),
            MyButton(
              buttonText: "Registrarse",
              colorText: Theme.of(context).primaryColor,
              outlined: true,
              onTap: () {
                  context.router.push(RegisterRoute());
                },
            ),
            const SizedBox(
              width: 1,
              height: 24,
            ),
            Text(
              'Desarrollado por Aristeia',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Quicksand',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
