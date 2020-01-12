import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String userId = "a";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Instagram Clone Coding",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
          color: Colors.black,
        )
      ),
      home: new HomeScreen(userId: userId),
    );
  }
}
