import 'package:aristeia_app/core/network/auth.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../core/widgets/date_picker.dart';
import '../../../estadistica/domain/usecases/roadmapsAsociadosAEtiqueta.dart';
import '../../../etiqueta/domain/repositories/getEtiqueta.dart';
import '../../domain/repositories/create_roadmap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aristeia_app/core/network/auth.dart';
@RoutePage()
class EditRoadmapScreen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();
  final int roadId;

  EditRoadmapScreen({
    super.key,
    @PathParam() required this.roadId,
  });
  @override
  State<EditRoadmapScreen> createState() => _EditRoadmapScreenState();
}

class _EditRoadmapScreenState extends State<EditRoadmapScreen> {
  List<FilterChipData> filterChips = [];
  TextEditingController nombreRoadmap = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController tipo_roadmap = TextEditingController();
  TextEditingController fechaInicio = TextEditingController();
  List<String> etiquetas = [];
  List<String> idEtiquetas = [];

  @override
  void initState() {
    super.initState();
    getFilterChipsFromFirestore().then((chips) {
      setState(() {
        filterChips = chips;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Editar roadmap',
        type: 1,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(children: [
            InputField(
                hintText: 'Nombre del roadmap', controller: nombreRoadmap),
            InputField(
                hintText: 'Descripción', maxLines: 3, controller: descripcion),
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
                    //print(value);
                    tipo_roadmap.text = value.toString();
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
                        backgroundColor:
                            EditRoadmapScreen.colors.backgroundColor,
                        color: Theme.of(context).primaryColor),
                    floatingLabelStyle: heading2bStyle.copyWith(
                        backgroundColor:
                            EditRoadmapScreen.colors.backgroundColor,
                        color: Theme.of(context).primaryColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(width: 0.5, style: BorderStyle.none),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
            DatePicker(
              hintText: "Fecha Inicio",
              controller: fechaInicio,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BoxText.section(
                  text: 'Etiquetas',
                  centered: false,
                  color: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 5, bottom: 12),
              child: buildFilterChips(),
            ),
            MyButton(
                buttonText: 'Guardar',
                onTap: () async {
                   print(widget.roadId);
                   FirebaseFirestore db = FirebaseFirestore.instance;
                   if (!nombreRoadmap.text.trim().isEmpty) {
                    db.collection('roadmap').doc(widget.roadId.toString()).update({"nombre": nombreRoadmap.text.trim()});
                  }
          if (!descripcion.text.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"descripcion": descripcion.text.trim()});
          }
          if (!fechaInicio.text.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"fechaInicio": fechaInicio.text.trim()});
          }
          if (!tipo_roadmap.text.isEmpty) {
            if (tipo_roadmap.text.trim() == '1') {
              db.collection('roadmap').doc(widget.roadId.toString()).update({"publico": true});
            } else {
              db.collection('roadmap').doc(widget.roadId.toString()).update({"publico": false});
            }
          }
          if (!etiquetas.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"etiquetas": etiquetas});
          }
          print("Todo realizado con Exito");
          context.router.navigate(widget.roadId as PageRouteInfo);
                  }
                ),
                MyButton(buttonText: 'Cancelar', outlined: true,),
                SizedBox(height: 20,)
          ]),
        ),
      ),
    );
  }

  Widget buildFilterChips() => Wrap(
        runSpacing: 8,
        spacing: 8,
        children: filterChips
            //filter chips es el widget que permite escoger las etiquetas de un roadmap
            .map((filterChip) => FilterChip(
                  label: Text(
                    filterChip.label,
                    style: heading3bStyle,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        filterChip.isSelected ? Colors.white : filterChip.color,
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
                    if (filterChip.isSelected == false) {
                      etiquetas.add(filterChip.label);
                      idEtiquetas.add(filterChip.id);
                    } else {
                      if (etiquetas.contains(filterChip.label)) {
                        etiquetas.remove(filterChip.label);
                        idEtiquetas.remove(filterChip.id);
                      }
                    }
                    print(etiquetas);
                  },
                  selected: filterChip.isSelected,
                  checkmarkColor: Colors.white,
                  selectedColor: filterChip.color.withOpacity(0.9),
                ))
            .toList(),
      );
}
