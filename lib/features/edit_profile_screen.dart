import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class EditProfileScreen extends StatelessWidget {

  static final gradients = AppGradients();

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBarWidget(
        title: 'Editar datos', 
        type: 1,
        onPressedLeading: () {
          context.router.popAndPush(ConfigurationRoute());
        },),
      
      body: Column(children: [
         InputField(hintText: 'Nombre', controller: TextEditingController())
      ]),
    );
  }
}