import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
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
      label: 'Avg. Customer Review',
      isSelected: false,

    ),
    FilterChipData(
      label: 'Sort By Relevance',
      isSelected: false,

    ),
  ];
}