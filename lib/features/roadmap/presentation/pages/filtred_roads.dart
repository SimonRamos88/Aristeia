import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/filters_drawer.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/get_roadmap_publico.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/my_search_delegate.dart';
import 'package:aristeia_app/features/roadmap/presentation/pages/my_roadmaps_screen.dart';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../buscador/domain/entities/buscador.dart';



class FiltredRoadmap extends StatefulWidget {
  final Buscador getRoad;
  const FiltredRoadmap({super.key, required this.getRoad});

  @override
  State<FiltredRoadmap> createState() => _FiltredRoadmapState();
}

class _FiltredRoadmapState extends State<FiltredRoadmap> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Resultados',
        type: 1,
        onPressedLeading: () {
           Navigator.pop(context);
        },
      ),
      body: widget.getRoad.getRoadmap(''),
    );
  }
}
