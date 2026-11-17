// diary_entry.dart

import 'package:flutter/material.dart';

class DiaryEntry {
  final DateTime date;
  final String colourHex;

  const DiaryEntry({required this.date, required this.colourHex});

  String get dateKey {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  Color get colour {
    final hex = colourHex.replaceFirst('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  static String colourToHex(Color colour) {
    final value = colour.toARGB32() & 0xFFFFFF;

    return '#${value.toRadixString(16).padLeft(6, '0')}';
  }
}
