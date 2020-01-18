import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF2d3447),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('PANSUK'),
              accountEmail: Text('donggov@gmail.com'),
              decoration: BoxDecoration(color: Colors.black54),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.face, color: Color(0xFF2d3447), size: 50.0,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(title: Text('Home', style: TextStyle(color: Colors.white),), leading: Icon(Icons.home, color: Colors.white,),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(title: Text('My account', style: TextStyle(color: Colors.white),), leading: Icon(Icons.person, color: Colors.white,),),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: (){},
              child: ListTile(title: Text('Settings', style: TextStyle(color: Colors.white),), leading: Icon(Icons.settings, color: Colors.white,),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(title: Text('Help', style: TextStyle(color: Colors.white),), leading: Icon(Icons.help, color: Colors.white,),),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: (){},
              child: ListTile(title: Text('Logout', style: TextStyle(color: Colors.white),), leading: Icon(Icons.exit_to_app, color: Colors.white,),),
            ),

//          Positioned(
//            bottom: 10,
//            left: 5,
//            child: Align(
//              alignment: Alignment.bottomLeft,
//              child: ListTile(title: Text('Logout'), leading: Icon(Icons.exit_to_app),),
//            ),
//          ),
          ],
        ),
      ),
    );
  }
}
