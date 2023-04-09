import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: Text('Iniciar sesión')),
          const SizedBox(
            width: 1,
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: Text('Registrarse')),
          const SizedBox(
            width: 1,
            height: 16,
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
    );
  }
}
