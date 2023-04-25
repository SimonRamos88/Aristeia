import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FilterChipData {

  static final colors = AppColors();

  final String label;
  final Color color;
  final bool isSelected;

  const FilterChipData({
    required this.label,
    this.color = const Color(0xff6D4CE4),
    this.isSelected = false,
  });

  FilterChipData copy({
    String? label,

    bool? isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterChipData &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          color == other.color &&
          isSelected == other.isSelected;

  @override
  int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;
}