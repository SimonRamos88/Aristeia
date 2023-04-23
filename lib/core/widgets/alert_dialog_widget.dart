import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final Function()? onTapLeft;
  final Function()? onTapRight;
  final String leftText;
  final String rightText;
  final String message;

  const AlertDialogWidget({
    super.key,
    this.onTapLeft,
    this.onTapRight,
    this.leftText = 'Aceptar',
    this.rightText = 'Cancelar',
    this.message = '¿Estas seguro de esto?',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 50),
      actionsPadding: EdgeInsets.only(right: 32, left: 32, bottom: 32),
      alignment: Alignment.center,

      //title: Text('Esta seguro '),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Text(
        message,
        style: interHeading3Style.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
                buttonText: leftText,
                outlined: true,
                large: false,
                width: 120,
                onTap: onTapLeft),
            SizedBox(
              width: 12,
            ),
            MyButton(
                buttonText: rightText,
                large: false,
                width: 120,
                onTap: onTapRight),
          ],
        )
      ],
    );
  }
}
