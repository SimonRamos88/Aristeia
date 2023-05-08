import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FilterChips {
  static final all = <FilterChipData>[
    const FilterChipData(
      label: 'Ciencias',
      isSelected: false,
    ),
    const FilterChipData(
      label: 'Ingeniería',
      isSelected: false,
    ),
    const FilterChipData(
      label: 'Música',
      isSelected: false,
    ),
    const FilterChipData(
      label: 'Arte',
      isSelected: false,
    ),
    const FilterChipData(
      label: 'Deporte',
      isSelected: false,
    ),
  ];
}

Future<List<FilterChipData>> getFilterChipsFromFirestore() async {
  final etiquetasSnapshot =
      await FirebaseFirestore.instance.collection('etiquetas').get();

  return etiquetasSnapshot.docs.map((doc) {
    return FilterChipData(
      label: doc['nombre'],
      isSelected: false,
    );
  }).toList();
}
