import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nintyninenames/item_model.dart';

class JsonParser {
  Future<List<Item>> parseJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final jsonItems = json.decode(jsonString) as List<dynamic>;
    final items = jsonItems.map((item) => Item.fromJson(item)).toList();
    return items;
  }
}
