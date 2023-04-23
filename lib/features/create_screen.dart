import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
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
      
      body: SingleChildScrollView(
        child: Column(children: [
          InputField(hintText: 'Nombre del roadmap', controller: TextEditingController()),
          InputField(hintText: 'Descripción', controller: TextEditingController()),
          Row(children: [
            Text('Tipo de roadmap'),

          ],),
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
      ),
    );
  }
}