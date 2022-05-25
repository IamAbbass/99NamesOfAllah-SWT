import 'package:flutter/material.dart';

class NameListPage extends StatefulWidget {
  const NameListPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NameListPage> createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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