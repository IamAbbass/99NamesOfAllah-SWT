import 'dart:convert';
import 'package:flutter/foundation.dart';

class BeautifulName {
  final int id;
  final String name_ar;
  final String name_en;
  final String meaning;
  
  const BeautifulName({
    required this.id,
    required this.name_ar,
    required this.name_en,
    required this.meaning,
  });

  factory BeautifulName.fromJson(Map<String, dynamic> json) {
    return BeautifulName(
        id: json['id'] as int,
        name_ar: json['name_ar'] as String,
        name_en: json['name_en'] as String,
        meaning: json['meaning'] as String);
  }
}