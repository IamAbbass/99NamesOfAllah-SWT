import 'package:flutter/material.dart';
import 'package:nintyninenames/constants.dart';
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
      body: 
      PageView.builder(
        itemCount: items.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Column(
            children: [
              // LinearProgressIndicator(value: ,),
              Container(
                padding: EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width - 100,

              child: 

              Expanded(
                
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: themePrimary, width: 5)
                  ),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      CircleAvatar(
                        radius: 36,
                        child: Text("${index + 1}", style: TextStyle(color: themePrimary, fontSize: 36),),
                        backgroundColor: Colors.white10,
                        foregroundColor: themePrimary,
                      ),
                      
                      SizedBox(height: 12),
                      Text(
                        item.nameAr,
                        style: TextStyle(
                          fontSize: 48,
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
                  ),
                )
              )),

            ],
          );
        },
      ),
    );
  }
}
