import 'package:flutter/material.dart';
import 'package:story_app_ui/models/data.dart';

class CreateStep01 extends StatefulWidget {
  @override
  _CreateStep01State createState() => _CreateStep01State();
}

class _CreateStep01State extends State<CreateStep01> {
  String option = 'option';

  // SelectionScreen을 띄우고 navigator.pop으로부터 결과를 기다리는 메서드
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()),);
    print(result);

    setState(() {
      option = result;
    });
  }

  @override
  Widget build(BuildContext context) {
//    String option = 'option';

    return Scaffold(
      appBar: AppBar(
        title: Text("Country"),
        backgroundColor: Color(0xFF2d3447),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (_) => CreateStep02(Travel(name: 'name'))));
              addPlace('New', '4.png', 12);
              Navigator.pop(context);
            },
            child: Text("next", style: TextStyle(fontSize: 17),),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(option),
//            Text(widget.option),
            RaisedButton(
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
              child: Text('Pick an option, any option!'),
            ),
          ],
        ),
      ),
    );
  }

}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // "Yep" 문자열과 함께 이전 화면으로 돌아갑니다...
                  // Yep 버튼은 결과로 "Yep!"을 반환합니다.
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // "Nope" 문자열과 함께 이전 화면으로 돌아갑니다.
                  // Nope 버튼은 결과로 "Nope!"을 반환합니다.
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}