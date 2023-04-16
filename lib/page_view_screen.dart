import 'package:flutter/material.dart';
import 'package:nintyninenames/item_model.dart';

class PageViewScreen extends StatelessWidget {
  final List<Item> items;
  final int initialIndex;

  PageViewScreen({required this.items, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items[initialIndex].nameAr),
      ),
      body: PageView.builder(
        itemCount: items.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.nameAr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  item.nameEn,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  item.meaning,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
