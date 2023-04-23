import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

//Falta terminarlo

class StateWidget extends StatelessWidget {
  final int estado;
  final bool large;

  const StateWidget({super.key, this.estado = 0, this.large = false});

  @override
  Widget build(BuildContext context) {
    Color textColor = estado == 0
        ? const Color(0xff438EE8)
        : estado == 1
            ? const Color(0xff2EA69B)
            : const Color(0xffFF8C6F);
    return Container(
      padding: large
          ? EdgeInsets.symmetric(horizontal: 12, vertical: 10)
          : EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: estado == 0
            ? const Color(0xffF0F3F7)
            : estado == 1
                ? const Color(0xffECFAF9)
                : const Color(0xffFFEEEA),
        borderRadius:
            large ? BorderRadius.circular(14) : BorderRadius.circular(10),
        boxShadow: [
          large? BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ) : BoxShadow(
            color: Color.fromARGB(43, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        estado == 0
            ? 'Sin iniciar'
            : estado == 1
                ? 'En progreso'
                : 'Terminado',
        style: large
            ? heading3bStyle.copyWith(color: textColor)
            : subheadingbStyle.copyWith(color: textColor),
      ),
    );
  }
}
