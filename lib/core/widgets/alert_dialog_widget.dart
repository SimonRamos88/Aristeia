import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final Function()? onTapLeft;
  final Function()? onTapRight;
  final String leftText;
  final String rightText;
  final String message;
  final Widget tituloPersonalizado;
  final Widget more;

  const AlertDialogWidget({
    super.key,
    this.onTapLeft,
    this.onTapRight,
    this.leftText = '',
    this.rightText = 'Cancelar',
    this.message = '¿Estas seguro de esto?',
    this.tituloPersonalizado = const SizedBox(
      width: 0,
      height: 0,
    ),
    this.more = const SizedBox(
      width: 0,
      height: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: more ==
              const SizedBox(
                width: 0,
                height: 0,
              )
          ? const EdgeInsets.symmetric(horizontal: 32, vertical: 32)
          : const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      actionsPadding: const EdgeInsets.only(right: 32, left: 32, bottom: 32),
      alignment: Alignment.center,

      //title: Text('Esta seguro '),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: (tituloPersonalizado ==
              const SizedBox(
                width: 0,
                height: 0,
              ))
          ? Text(
              message,
              style: interHeading3Style.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          : tituloPersonalizado,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Container(
          alignment: Alignment.center,
          child: more,
        ),
        more ==
                const SizedBox(
                  width: 0,
                  height: 0,
                )
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : const SizedBox(height: 32),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (leftText != '')
                ? MyButton(
                    buttonText: leftText,
                    outlined: true,
                    large: false,
                    width: 150,
                    onTap: onTapLeft)
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            const SizedBox(
              height: 16,
            ),
            MyButton(
                buttonText: rightText,
                large: false,
                width: 150,
                onTap: onTapRight),
          ],
        )
      ],
    );
  }
}
