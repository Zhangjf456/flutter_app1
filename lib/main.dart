import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basie_widget.dart';
import 'components_picker_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int currentstat = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentstat,
        children: <Widget>[BasicBottomWidget(), ComponentPickerWidget()],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.wallpaper), title: Text('按钮')),
          BottomNavigationBarItem(icon: Icon(Icons.build), title: Text('scaffold'))
        ],
        currentIndex: currentstat,
        onTap: (index) {
          setState(() {
            currentstat = index;
          });
        },
      ),
    );
  }
}
