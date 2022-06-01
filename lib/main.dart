import 'package:flutter/material.dart';
import 'package:nintynine_beautifulnames/name_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '99 Beautiful Names',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark
      ),
      home: const MyHomePage(title: '99 Beautiful Names'),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

            
              ElevatedButton(
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all<Color>(themeColorLight),
                // ),
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => NameListPage(type: 1)));
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Names of Allah (SWT)",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "(الله جلّ جلاله)",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            " اَلاسْمَاءُ الْحُسناى",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 24,
                            ),
                          ),
                          
                          
                        ],
                      )


                     
                      
                    ],
                  ),
                ),
              ),



              SizedBox(height:12),

              ElevatedButton(
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all<Color>(themeColorLight),
                // ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => NameListPage(type: 2)));
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Names of Muhammed (SAW)",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ﷺ",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "اسماء محمد",
                            style: TextStyle(
                              // color: themeColor,
                              fontSize: 24,
                            ),
                          ),
                          
                          
                        ],
                      ),      
                    ],
                  ),
                ),
              ),           
          ],
        ),
      ),
    );
  }
}