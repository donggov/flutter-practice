import 'package:flutter/material.dart';
import 'package:story_app_ui/models/data.dart';

class CreateStep02 extends StatefulWidget {
  @override
  _CreateStep02State createState() => _CreateStep02State();
}

class _CreateStep02State extends State<CreateStep02> {

  void save() {
    print("save~~!");
    addPlace('New', '1.png', 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        backgroundColor: Color(0xFF2d3447),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              save();
//              List<Place> places = [
//                Place(place: 'France', image: '1.png', days: 10),
//                Place(place: 'Prague', image: '2.png', days: 3),
//                Place(place: 'Holland', image: '3.png', days: 3),
//                Place(place: '라오스', image: '4.png', days: 5),
//              ];

              Navigator.of(context).popUntil((route) => route.isFirst);
//              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
//              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text("save", style: TextStyle(fontSize: 17),),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(child: Text("Step 2")),
    );
  }
}
