import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class CreateScreen extends StatelessWidget {

  static final gradients = AppGradients();

  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarWidget(title: 'Crear roadmap', type: 0),
      
      body: Column(children: [
         MyButton(
            large: false,
            buttonText: "Agregar etiqueta",
            width: 301,
            backgroundGradient: gradients.blueGradient,
            onTap: () {
              print('Share');
            },
          ),
      ]),
    );
  }
}