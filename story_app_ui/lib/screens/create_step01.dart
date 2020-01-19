import 'package:flutter/material.dart';
import 'package:story_app_ui/screens/create_step02.dart';

class CreateStep01 extends StatefulWidget {
  @override
  _CreateStep01State createState() => _CreateStep01State();
}

class _CreateStep01State extends State<CreateStep01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country"),
        backgroundColor: Color(0xFF2d3447),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CreateStep02()));
            },
            child: Text("next", style: TextStyle(fontSize: 17),),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(child: Text("Step 1")),
    );
  }
}