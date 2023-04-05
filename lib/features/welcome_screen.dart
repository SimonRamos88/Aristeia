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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/welcomeImage.png')),
          Text(
            'RoadmapTo',
            style: TextStyle(
              color: colors.mainColor,
              fontSize: 50,
               fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w700,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: Text('Iniciar sesión')),
          ElevatedButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: Text('Registrarse')),
          const Text(
            'Desarrollado por Aristeia',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
