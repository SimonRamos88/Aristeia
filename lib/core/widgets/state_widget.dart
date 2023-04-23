import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

//Falta terminarlo

class StateWidget extends StatelessWidget {
  final int estado;
  final bool large;

  const StateWidget({super.key, this.estado = 0, this.large = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: large? EdgeInsets.symmetric(horizontal: 12, vertical: 10):EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xff466CFF),
        borderRadius: large? BorderRadius.circular(14) :BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
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
        style: large? heading3bStyle .copyWith(color: Colors.white): subheadingbStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
