import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/auth.dart';
import '../../../../core/widgets/alert_dialog_widget.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  static final gradients = AppGradients();
  EditProfileScreen({super.key});

  State<EditProfileScreen> createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  late final TextEditingController _controllerUsertag = TextEditingController();
  late final TextEditingController _controllerName = TextEditingController();

  final User? user = Auth().currentUser;
  String usertag = 'usertag';
  String usernames = 'nombres';
  Map<String, dynamic> respuesta = {"": ""};

  Future<void> updateUserData() async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(Auth().currentUser?.uid)
        .update({
      "usertag": _controllerUsertag.text.trim().isEmpty
          ? usertag
          : _controllerUsertag.text.trim(),
      "nombres": _controllerName.text.trim().isEmpty
          ? usernames
          : _controllerName.text.trim(),
    }).then((value) {
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
        content: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Datos actualizados correctamente',
              textAlign: TextAlign.center,
              style: heading3bStyle,
            )),
      ),
    );
      context.router.popAndPush(ConfigurationRoute());
    }
    );
  }

  Future<void> readUserData() async {
    final docUser = FirebaseFirestore.instance
        .collection('usuarios')
        .doc((Auth().currentUser?.uid));
    final queryU = await docUser.get();
    if (mounted) {
      setState(() {
        respuesta = queryU.data() as Map<String, dynamic>;
        usertag = respuesta['usertag'];
        usernames = respuesta['nombres'];
        _controllerUsertag.text = usertag;
      _controllerName.text = usernames;
      });
    }
  }

  @override
  void initState() {
    readUserData();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Editar datos',
        type: 1,
        onPressedLeading: () {
          context.router.popAndPush(ConfigurationRoute());
        },
      ),
      body: Column(children: [
        InputField(
            hintText: 'Nombre',
            controller: _controllerName,
            textIn: usernames,
            textInDefined: true),
        InputField(
            hintText: 'Usuario',
            controller: _controllerUsertag,
            textIn: usertag,
            textInDefined: true),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              buttonText: 'Cancelar',
              onTap: () {
                Navigator.of(context).pop();
              },
              outlined: true,
              large: false,
              width: 150,
              pink: false,
              blue: false,
            ),
            const SizedBox(width: 10),
            MyButton(
              buttonText: 'Guardar',
              onTap: () {
                updateUserData();
                Navigator.of(context).pop();
              },
              large: false,
              width: 150,
            ),
          ],
        )
      ]),
    );
  }
}
