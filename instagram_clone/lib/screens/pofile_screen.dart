import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/models/user_provider.dart';
import 'package:instagram_clone/models/user_repository.dart';
import 'package:instagram_clone/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    User _user = UserRepository.findById(widget.userId);

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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/boy.png'),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('12', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                              Text('posts', style: TextStyle(color: Colors.black54))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('111', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                              Text('followers', style: TextStyle(color: Colors.black54))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('222', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                              Text('folowing', style: TextStyle(color: Colors.black54))
                            ],
                          )
                        ],
                      ),
                      (_user.id == Provider.of<UserProvider>(context).userId) ?
                        Container(
                          width: 180.0,
                          child: FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => EditProfileScreen(user: _user))
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Edit Profile', style: TextStyle(fontSize: 18.0),),
                          ),
                        )
                      : SizedBox(
                        height: 45.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _user.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0,),
                Container(
                  height: 80.0,
                  child: Text(_user.bio, style: TextStyle(fontSize: 15.0)),
                ),
                Divider(),
            ],),
          )
        ],
      ),
    );
  }
}
