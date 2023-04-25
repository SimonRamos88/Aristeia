import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:aristeia_app/core/widgets/filter_chips.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

@RoutePage()
class CreateScreen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();

  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<FilterChipData> filterChips = FilterChips.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Crear roadmap', type: 0),
      body: SingleChildScrollView(
        child: Column(children: [
          InputField(
              hintText: 'Nombre del roadmap',
              controller: TextEditingController()),
          InputField(
              hintText: 'Descripción',
              maxLines: 3,
              controller: TextEditingController()),
          Padding(
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
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                    value: '1',
                    child: Text(
                      'Público',
                    ),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Privado'),
                  )
                ],
                onChanged: (value) {
                  print(value);
                },
                focusColor: Colors.transparent,
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(30),
                style: interHeading3Style.copyWith(color: Colors.black),
                decoration: InputDecoration(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  labelText: 'Tipo de roadmap',
                  labelStyle: heading3bStyle.copyWith(
                      backgroundColor: CreateScreen.colors.backgroundColor,
                      color: Theme.of(context).primaryColor),
                  floatingLabelStyle: heading2bStyle.copyWith(
                      backgroundColor: CreateScreen.colors.backgroundColor,
                      color: Theme.of(context).primaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.5, style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          BoxText.section(
              text: 'Etiquetas',
              centered: false,
              color: Theme.of(context).primaryColor),
          buildFilterChips(),    
          // MyButton(
          //   large: false,
          //   buttonText: "Agregar etiqueta",
          //   width: 301,
          //   backgroundGradient: CreateScreen.gradients.blueGradient,
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: ((context) => AlertDialogWidget(
          //             message: 'Elija la etiqueta que desea agregar',
          //             leftText: 'Cerrar',
          //             rightText: 'Cancelar',
          //             // more: buildFilterChips(),
          //             onTapLeft: () {},
          //             onTapRight: () {
          //               Navigator.of(context).pop();
          //             },
          //           )),
          //     );
          //   },
          // ),
         
          MyButton(buttonText: 'Continuar', onTap: () {context.router.push(Create2Route());}),
        ]),
      ),
    );
  }

  Widget buildFilterChips() => Wrap(
        runSpacing: 8,
        spacing: 8,
        children: filterChips
            .map((filterChip) => FilterChip(
                  label: Text(
                    filterChip.label,
                    style: heading3bStyle,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.color,
                  ),
                  backgroundColor: filterChip.color.withOpacity(0.1),
                  onSelected: (isSelected) {

                    setState(() {
                      filterChips = filterChips.map((otherChip) {
                        return filterChip == otherChip
                            ? otherChip.copy(isSelected: isSelected)
                            : otherChip;
                      }).toList();
                    });
                    print(filterChip.isSelected);
                    print(filterChip.label);
                  },
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.color,
                  selectedColor: filterChip.color.withOpacity(0.25),
                ))
            .toList(),
      );
}

//https://www.youtube.com/watch?v=p2X7woOEFUE&ab_channel=HeyFlutter%E2%80%A4com