import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class InputField extends StatelessWidget {
  final String hintText;
  //final Function(String) validator;
  //final Function(String) onSaved;
  final double height;
  final double width;
  final bool isPassword;
  final int lengthText;

  const InputField(
      {Key? key,
      required this.hintText,
      // required this.validator,
      // required this.onSaved,
      this.isPassword = false,
      this.lengthText = 15,
      this.height = 53,
      this.width = 284});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(70, 80, 250, 0.7),
                Color.fromRGBO(93, 35, 187, 0.694)
              ]),
              width: 3),
        ),
        child: TextField(
          cursorColor: const Color.fromRGBO(70, 80, 250, 0.7),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLength: lengthText,
          decoration: InputDecoration(
            counterText: "",
            hintText: hintText,
            hintStyle: const TextStyle(color: Color.fromRGBO(70, 80, 250, 0.7)),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
          ),
          obscureText: isPassword,
          style: const TextStyle(
              color: Color.fromRGBO(40, 40, 46, 0.7), fontSize: 16),
        ),
      ),
    );
  }
}
