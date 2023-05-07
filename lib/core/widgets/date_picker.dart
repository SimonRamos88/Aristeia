import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  //final Function(String) validator;
  //final Function(String) onSaved;
  final double height;
  final double width;
  final bool textInDefined;
  final int lengthText;
  final int maxLines;
  final String textIn;

  DatePicker(
      {Key? key,
      required this.hintText,
      required this.controller,
      // required this.validator,
      // required this.onSaved,
      this.lengthText = 100,
      this.height = 70,
      this.width = 284,
      this.maxLines = 1,
      this.textInDefined = false,
      this.textIn = ''});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime today = DateTime.now();
  static final colors = AppColors();

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(width: 0.5, style: BorderStyle.none),
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
          cursorColor: colors.mainColor,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLength: widget.lengthText,
          style: interHeading3Style.copyWith(color: Colors.black),
          decoration: InputDecoration(
            
            prefixIcon: Icon(
              Icons.calendar_today_outlined,
              color: Theme.of(context).primaryColor,
            ) ,
            enabledBorder: circularBorder,
            focusedBorder: circularBorder.copyWith(
              borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color.fromARGB(97, 157, 70, 250)),
            ),
            counterText: "",
            hintText: widget.textInDefined ? widget.textIn : '',
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
          onTap: () async {
            DateTime? newDate = await showDatePicker(
                builder: (context, child) => Theme(
                    data: ThemeData().copyWith(
                        colorScheme: ColorScheme.light(
                            primary: Theme.of(context).primaryColor,
                            onPrimary: Colors.white,
                            surface: Colors.black,
                            onSurface: Colors.black,
                            ),
                            
                            ),
                    child: child!),
                context: context,
                cancelText: 'Cancelar',
                confirmText: 'Guardar',
                initialDate: today,
                firstDate: DateTime(1950),
                lastDate: DateTime(2040));
            if (newDate == null)
              return;
            else {
              setState(() {
                today = newDate;
                String mes = today.month.toString();

                if (mes.length == 1) mes = '0' + mes;
                widget.controller.text = today.year.toString() +
                    '-' +
                    mes +
                    '-' +
                    today.day.toString();
              });
            }
          },
        ),
      ),
    );
  }
}
