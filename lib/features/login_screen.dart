import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
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
            context.router.replace(const WelcomeRouter());
          },
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage('assets/images/loginImage.png'),
            ),
            TextField(),
            TextField(),
            ElevatedButton(
                onPressed: () {
                  context.router.replace(const LoggedWrapperRoute());
                },
                child: Text('Iniciar sesión')),
            TextButton(onPressed: () {}, child: Text('No tienes cuenta'))
          ],
        ));
  }
}
