import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String text;

  IconCard({this.iconData, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(icon: Icon(iconData, size: 30, color: Colors.black87), onPressed: (){},),
          ),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 12),),
        ],
      ),
    );
  }
}
