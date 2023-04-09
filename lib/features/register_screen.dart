import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          TextField(),
          TextField(),
          TextField(),
        ],
      ),
    );
    ;
  }
}
