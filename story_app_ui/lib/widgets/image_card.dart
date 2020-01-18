import 'package:flutter/material.dart';
import 'package:story_app_ui/models/Place.dart';

class ImageCard extends StatelessWidget {
  final String name;
  final int days;
  final String image;
  final Place place;

  ImageCard({
    @required this.name,
    @required this.days,
    @required this.image,
    this.place
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
//      padding: EdgeInsets.all(4),
      padding: EdgeInsets.only(left: 20.0),
      child: InkWell(
//        onTap: () {
//          Navigator.push(context, MaterialPageRoute(builder: () => Detail(place)));
//        },
        onTap: (){
          print('onTap');
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
//          height: MediaQuery.of(context).size.width * 1,
//          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
//                Image.asset("assets/images/$image", height: 260, width: 200, fit: BoxFit.cover,),
                Image.asset("assets/images/$image", fit: BoxFit.cover,),
//                Align(
//                  alignment: Alignment.bottomCenter,
//                  child: Container(
//                    height: 100,
//                    width: 200,
//                    decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                        begin: Alignment.bottomCenter,
//                        end: Alignment.topCenter,
//                        colors: [
//                          Colors.black.withOpacity(0.8),
//                          Colors.black.withOpacity(0.7),
//                          Colors.black.withOpacity(0.6),
//                          Colors.black.withOpacity(0.6),
//                          Colors.black.withOpacity(0.4),
//                          Colors.black.withOpacity(0.1),
//                          Colors.black.withOpacity(0.05),
//                          Colors.black.withOpacity(0.025),
//                        ],
//                      )
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 8.0),
//                    ),
//                  ),
//                ),

                Positioned(
                  bottom: 30,
                  left: 3,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: '$name', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                        ]
                      ),),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  left: 5,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Colors.white, size: 14,),
                          SizedBox(width: 5,),
                          Text("$days days", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
