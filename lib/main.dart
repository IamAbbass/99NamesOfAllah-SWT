import 'package:flutter/material.dart';
import 'package:nintyninenames/item_model.dart';
import 'package:nintyninenames/json_parser.dart';
import 'package:nintyninenames/page_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Item> _allahItems = [];
  List<Item> _muhammadItems = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadAllahItems();
    _loadMuhammadItems();
  }

  Future<void> _loadAllahItems() async {
    final items = await JsonParser().parseJson('assets/allah_swt.json');
    setState(() => _allahItems = items);
  }

  Future<void> _loadMuhammadItems() async {
    final items = await JsonParser().parseJson('assets/muhammad_saw.json');
    setState(() => _muhammadItems = items);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Demo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'الله'),
              Tab(text: 'مُحَمَّد'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildItemList(_allahItems),
            _buildItemList(_muhammadItems),
          ],
        ),
      ),
    );
  }

  Widget _buildItemList(List<Item> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return ListTile(
          title: Text(item.nameAr),
          subtitle: Text(item.meaning),
          onTap: () => _openPageView(context, items, index),
        );
      },
    );
  }

  void _openPageView(BuildContext context, List<Item> items, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PageViewScreen(items: items, initialIndex: initialIndex),
      ),
    );
  }
}
