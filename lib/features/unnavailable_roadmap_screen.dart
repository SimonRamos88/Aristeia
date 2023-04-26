import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UnnavailableRoadmapScreen extends StatelessWidget {
  static final gradients = AppGradients();

  const UnnavailableRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: '', type: 1),
      body: Column(children: [
        MyButton(
          large: false,
          buttonText: "Roadmap no disponible",
          width: 301,
          backgroundGradient: gradients.blueGradient,
          onTap: () {
            context.router.push(
              HomeRoute(),
            );
          },
        ),
      ]),
    );
  }
}
