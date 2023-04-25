import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  //final Function(String) validator;
  //final Function(String) onSaved;
  final double height;
  final double width;
  final bool isPassword;
  final int lengthText;
  final int maxLines;

  InputField(
      {Key? key,
      required this.hintText,
      required this.controller,
      // required this.validator,
      // required this.onSaved,
      this.isPassword = false,
      this.lengthText = 100,
      this.height = 70,
      this.width = 284,
      this.maxLines = 1,
      });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  static final colors = AppColors();
  bool _obscurepassword = true;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(width: 0.5, style: BorderStyle.none),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(70, 80, 250, 0.7),
                Color.fromRGBO(93, 35, 187, 0.694)
              ]),
              width: 3),
        ),
        child: TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          cursorColor: const Color.fromRGBO(70, 80, 250, 0.7),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLength: widget.lengthText,
          style: interHeading3Style.copyWith(color: Colors.black),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () =>
                        setState(() => (_obscurepassword = !_obscurepassword)),
                    icon: Icon(
                      _obscurepassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ))
                : null,
            enabledBorder: circularBorder,
            focusedBorder: circularBorder.copyWith(
              borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color.fromARGB(97, 157, 70, 250)),
            ),
            counterText: "",
            labelText: widget.hintText,
            labelStyle: heading3bStyle.copyWith(
                backgroundColor: colors.backgroundColor,
                color: Theme.of(context).primaryColor),
            floatingLabelStyle: heading2bStyle.copyWith(
                backgroundColor: colors.backgroundColor,
                color: Theme.of(context).primaryColor),
            border: circularBorder,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
          ),
          obscureText: widget.isPassword ? _obscurepassword : false,
        ),
      ),
    );
  }
}
