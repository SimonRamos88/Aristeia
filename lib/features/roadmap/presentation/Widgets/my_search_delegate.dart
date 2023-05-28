import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/get_roadmap_privado.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/get_roadmap_publico.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/show_road.dart';

class MySearchDelegate extends SearchDelegate {
  static final colors = AppColors();
  final String tipo;
  showRoad getRoadPublico = GetRoadmapPublico();
  showRoad getRoadPrivado = GetRoadmapPublico();

  MySearchDelegate(this.tipo);

  @override
  String? get searchFieldLabel => 'Buscar';

  @override
  TextStyle? get searchFieldStyle =>
      heading3bStyle.copyWith(color: Colors.black);

  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
    
        floatingLabelAlignment: FloatingLabelAlignment.center,
        labelStyle: heading3bStyle.copyWith(color: colors.mainColor),
        suffixIconColor: colors.mainColor,
        iconColor: colors.mainColor,
        prefixIconColor: colors.mainColor,
        fillColor: colors.mainColor,
        focusColor: colors.mainColor,
        hoverColor: colors.mainColor,
        hintStyle: heading3bStyle.copyWith(color: Colors.grey),
        border: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        floatingLabelStyle: heading3bStyle.copyWith(color: Colors.red),
        //floatingLabelStyle: heading3bStyle.copyWith(color:Colors.red),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return (tipo == 'publico')
        ? getRoadPublico.getRoadmap(query)
        : getRoadPrivado.getRoadmap(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
// https://www.youtube.com/watch?v=Xinjf7AQUYA&ab_channel=HeyFlutter%E2%80%A4com