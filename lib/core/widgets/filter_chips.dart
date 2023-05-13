import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilterChips {
  static final all = <FilterChipData>[
    FilterChipData(
      label: 'Ciencias',
      isSelected: false,
    ),
    FilterChipData(
      label: 'Ingeniería',
      isSelected: false,
    ),
    FilterChipData(
      label: 'Música',
      isSelected: false,
    ),
    FilterChipData(
      label: 'Arte',
      isSelected: false,
    ),
    FilterChipData(
      label: 'Deporte',
      isSelected: false,
    ),
  ];
}

// Trae las etiquetas de la base las convierte en filterchip
Future<List<FilterChipData>> getFilterChipsFromFirestore() async {
  final etiquetasSnapshot =
      await FirebaseFirestore.instance.collection('etiquetas').get();

  return etiquetasSnapshot.docs.map((doc) {
    return FilterChipData(
      label: doc['nombre'],
      isSelected: false,
      numRoadAso: doc['numeroRoadmapsAsociados'],
      id: doc.id,
    );
  }).toList();
}
