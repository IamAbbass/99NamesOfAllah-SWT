import 'package:flutter/material.dart';
import 'package:nintyninenames/item_model.dart';
import 'package:nintyninenames/json_parser.dart';
import 'package:nintyninenames/page_view_screen.dart';
import 'package:nintyninenames/constants.dart';
// import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>  { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '99 names of $muhammad & $allah',
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      home: MyStatefulWidget()
    );
  }  
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin {
  int _counter = 0;
   late TabController _tabController;
  List<Item> _allahItems = [];
  List<Item> _muhammadItems = [];

  Future<void> _loadAllahItems() async {
    final items = await JsonParser().parseJson('assets/allah_swt.json');
    setState(() => _allahItems = items);
  }

  Future<void> _loadMuhammadItems() async {
    final items = await JsonParser().parseJson('assets/muhammad_saw.json');
    setState(() => _muhammadItems = items);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadAllahItems();
    _loadMuhammadItems();
  }

  // Widget _buildItemList(List<Item> items) {
  //   return ListView.builder(
  //     itemCount: items.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       final item = items[index];
  //       return ListTile(
  //         title: Text(item.nameAr),
  //         subtitle: Text(item.meaning),
  //         onTap: () => _openPageView(context, items, index),
  //       );
  //     },
  //   );
  // }

  Widget _buildItemGrid(context, List<Item> items) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PageViewScreen(items: items, initialIndex: index)),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AutoSizeText(
                //   'The text to display',
                //   style: TextStyle(fontSize: 20),
                //   maxLines: 2,
                // ),
                Text("${index + 1}", style: TextStyle(color: Colors.white54)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  item.nameAr,
                  style: TextStyle(
                      color: themePrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  item.nameEn,
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '99 Names of $muhammad & $allah',
          ),
          bottom: TabBar(
            indicatorColor: themePrimary,
            controller: _tabController,
            tabs: [
              Tab(
                  child: Text(allah,
                      style: TextStyle(
                          // color: themePrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold))),
              Tab(
                  child: Text(muhammad,
                      style: TextStyle(
                          // color: themePrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildItemGrid(context, _allahItems),
            _buildItemGrid(context, _muhammadItems),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: themePrimary,
        //   child: Icon(Icons.play_arrow),
        //   onPressed: (){
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               PageViewScreen(items: _allahItems, initialIndex: 0)),
        //     );
        //   }
        // ),
      );
  }
}