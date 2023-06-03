import 'dart:developer';

import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:aristeia_app/core/widgets/filter_chips.dart';
import 'package:aristeia_app/features/roadmap/presentation/pages/my_roadmaps_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../buscador/domain/entities/buscador.dart';
import '../../domain/entities/show_road.dart';
import '../pages/filtred_roads.dart';

class FiltersDrawer extends StatefulWidget {
  const FiltersDrawer({super.key});

  @override
  State<FiltersDrawer> createState() => _FiltersDrawerState();
}

class _FiltersDrawerState extends State<FiltersDrawer> {
  List<FilterChipData> filterChips = [];
  List<String> etiquetas = [];
  List<String> idEtiquetas = [];
  List<Map> roads = [];

  Buscador buscador = Buscador();

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
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                'Filtrar por etiquetas',
                style: heading2bStyle.copyWith(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 5, bottom: 12),
              child: buildFilterChips(),
            ),
            MyButton(
              buttonText: 'Filtrar',
              onTap: () async {
                await buscador.BuscarByEt(etiquetas);
                Navigator.push(context, MaterialPageRoute(builder: (context) => FiltredRoadmap(getRoad: buscador,)));
                //Scaffold.of(context).closeEndDrawer(); //enviarle el buscador a myroads
              },
            ),
            MyButton(
              buttonText: 'Cancelar',
              outlined: true,
              onTap: () => Scaffold.of(context).closeEndDrawer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterChips() => Wrap(
        runSpacing: 1,
        spacing: 2,
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
