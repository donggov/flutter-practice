import 'package:flutter/material.dart';

class DetailHomeScreen extends StatefulWidget {
  @override
  _DetailHomeScreenState createState() => _DetailHomeScreenState();
}

class _DetailHomeScreenState extends State<DetailHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 100,
            child: Row(
              children: <Widget>[
                Icon(Icons.backspace)
              ],
            ),
          ),
          DetailHomeBackground(),
          DetailHomeContent(),
        ],
      ),
    );
  }
}

class DetailHomeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.asset(
          "assets/images/1.png",
          fit: BoxFit.cover,
          width: screenWidth,
          height: screenHeight * 0.5,
          color: Colors.black26,
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 100);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85, curveEndPoint.dx - 60, curveEndPoint.dy + 10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}

class DetailHomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text("France", style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),)),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.white,),
                SizedBox(width: 10,),
                Text("France, Marseille, Nice", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah Blah", style: TextStyle(color: Colors.white, fontSize: 20.0, ),)),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("MEMBER", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 5, top: 5),
//            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(radius: 30.0, backgroundImage: AssetImage("assets/images/boy.png"),),
//                    Text('PANSUK'),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
