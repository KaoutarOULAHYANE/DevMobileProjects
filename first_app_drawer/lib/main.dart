import 'package:first_app_drawer/myDrawer.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Text("Hello",
            style: TextStyle(
              fontSize: 30,
            )),
      ),
      drawer: MyDrawer(),
    );
  }
}
