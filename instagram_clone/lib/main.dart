import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Instagram Clone Coding",
      home: new HomeScreen(),
    );
  }
}
