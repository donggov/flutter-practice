import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:story_app_ui/screens/create_step01.dart';
import 'package:story_app_ui/widgets/app_drawer.dart';
import 'package:story_app_ui/screens/detail_screen.dart';
import 'package:story_app_ui/widgets/icon_card.dart';
import 'package:story_app_ui/widgets/image_cards.dart';
import 'package:story_app_ui/widgets/route_animator.dart';
import 'models/data.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


var cardAspectRatio = (12.0 / 16.0);
var widgetAspectRatio = (cardAspectRatio * 1.2);

class _MyAppState extends State<MyApp> {
//  final GlobalKey _scaffoldKey = new GlobalKey();
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var currentPage = images.length - 1.0;
  int _historyCurrentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i=0; i<list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      appBar: AppBar(
          title: Text("TRAVELER", style: TextStyle(fontSize: 30.0),), backgroundColor: Color(0xFF2d3447),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 30.0),
              onPressed: () {
                Navigator.push(context, SlideTopRoute(page: CreateStep01()));
              },
            ),
          ],
      ),
      drawer: AppDrawer(),
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  IconButton(
//                    icon: Icon(Icons.menu, color: Colors.white, size: 30.0),
//                    onPressed: () {},
//                  ),
//                  IconButton(
//                    icon: Icon(Icons.search, color: Colors.white, size: 30.0),
//                    onPressed: () {},
//                  ),
//                ],
//              ),
//            ),

            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconCard(iconData: Icons.assignment_ind, text: 'Passport',),
                IconCard(iconData: Icons.attach_money, text: 'Currency',),
                IconCard(iconData: Icons.directions, text: 'Navi',),
                IconCard(iconData: Icons.info, text: 'Tip',),
              ],
            ),

            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Timeline', style: TextStyle(color: Colors.white, fontSize: 46.0, letterSpacing: 1.0,)),
                  IconButton(
                    icon: Icon(Icons.more_horiz, color: Colors.white, size: 30.0),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                        child: Text("Animated", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text("4 Stories", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CarouselSlider(
                height: 320.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                onPageChanged: (index) {
                  setState(() {
                    _historyCurrentIndex = index;
                  });
                },
                items: places.map((i) {
                  String place = i.place;
                  String image = i.image;
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.asset("assets/images/$image", fit: BoxFit.cover,),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        child: Text('$place', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                                          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20.0)),
                                          child: Text("Read Later", style: TextStyle(color: Colors.white),),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(places, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _historyCurrentIndex == index ? Colors.blueAccent : Colors.white,
                  ),
                );
              }),
            ),

            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Timeline', style: TextStyle(color: Colors.white, fontSize: 46.0, letterSpacing: 1.0,)),
//                  IconButton(
//                    icon: Icon(Icons.add, color: Colors.white, size: 30.0),
//                    onPressed: () {},
//                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                        child: Text("Animated", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text("4 Stories", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            ImageCards(),

            SizedBox(height: 30.0,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Trending', style: TextStyle(color: Colors.white, fontSize: 46.0, letterSpacing: 1.0,)),
                  IconButton(
                    icon: Icon(Icons.more_horiz, color: Colors.white, size: 30.0),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                        child: Text("Animated", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text("25+ Stories", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),

            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                    child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        }
                    ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;
          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (var i=0; i < images.length; i++) {
            var delta = i - currentPage;
            var isOnRight = delta > 0;
            var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15: 1), 0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0,
                      )
                    ]
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[i], fit: BoxFit.cover,),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  title[i],
                                  style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20.0)),
                                  child: Text("Read Later", style: TextStyle(color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );

            cardList.add(cardItem);
          }

          return Stack(
            children: cardList,
          );

        },
      ),
    );
  }
}
