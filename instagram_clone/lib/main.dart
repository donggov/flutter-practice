import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_provider.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget _getScreenId() {
    return Builder(
      builder: (context) {
        Provider.of<UserProvider>(context).userId = "a";
        return HomeScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => UserProvider(),
      child: new MaterialApp(
        title: "Instagram Clone Coding",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: Colors.black,
          )
        ),
        home: _getScreenId(),
      ),
    );
  }
}
