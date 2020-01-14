import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  _buildPost() {
    return Container(height: 200.0, margin: EdgeInsets.all(10.0),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 35.0,
          ),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(context),
          child: Text("Logout"),
        )
      ),
    );
  }
}
