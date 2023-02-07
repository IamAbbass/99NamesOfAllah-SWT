import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:nintynine_beautifulnames/model.dart';

class NameListPage extends StatefulWidget {
  const NameListPage({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  State<NameListPage> createState() => _NameListPageState();
}

List<BeautifulName> parseBeautifulName(String data) {
  final parsed = jsonDecode(data).cast<Map<String, dynamic>>();
  return parsed.map<BeautifulName>((json) => BeautifulName.fromJson(json)).toList();
}

class _NameListPageState extends State<NameListPage> {

   loadJson() async {
    String jsonData           = await rootBundle.loadString('assets/allah_swt.json');
    final parsed              = jsonDecode(jsonData).cast<Map<String, dynamic>>();
    List<BeautifulName> names = parsed.map<BeautifulName>((json) => BeautifulName.fromJson(json)).toList();

    List<Widget> childrens = [];
    names.forEach((name) { 
      childrens.add(ListTile(
        title: Text(name.name_ar),
      ));
    });

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      }),
    );
  }

  // void parseJson(){

    
  //   return 

  // }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.type).toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


          ],
        ),
      ),
    );
  }
}



// List<Voucher> parseVouchers(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Voucher>((json) => Voucher.fromJson(json)).toList();
// }