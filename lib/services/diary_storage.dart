// diary_storage.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/diary_entry.dart';

class DiaryStorage {
  static const String storageKey = 'diary';

  Future<Map<String, DiaryEntry>> loadDiary() async {
    final preferences = await SharedPreferences.getInstance();

    final rawData = preferences.getString(storageKey);

    if (rawData == null || rawData.isEmpty) return {};

    try {
      final Map<String, dynamic> decodedData = jsonDecode(rawData);

      final Map<String, DiaryEntry> entries = {};

      decodedData.forEach((dateKey, colourHex) {
        if (colourHex is! String) return;

        final date = DateTime.tryParse(dateKey);

        if (date == null) return;

        entries[dateKey] = DiaryEntry(date: date, colourHex: colourHex);
      });

      return entries;
    } catch (_) {
      return {};
    }
  }

  Future<void> saveDiary(Map<String, DiaryEntry> entries) async {
    final preferences = await SharedPreferences.getInstance();

    final Map<String, String> data = {};

    entries.forEach((dateKey, entry) {
      data[dateKey] = entry.colourHex;
    });

    await preferences.setString(storageKey, jsonEncode(data));
  }

  Future<void> saveEntry(DiaryEntry entry) async {
    final entries = await loadDiary();

    entries[entry.dateKey] = entry;

    await saveDiary(entries);
  }
}
