import 'package:flutter/material.dart';
import 'package:story_app_ui/models/Place.dart';
import 'package:story_app_ui/models/data.dart';
import 'package:story_app_ui/widgets/image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {


  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(left: 20.0),
      height: 320,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (_, index) {
            return ImageCard(
                place: places[index],
                name: places[index].place,
                days: places[index].days,
                image: places[index].image,
            );
          },
      ),
    );
  }
}
