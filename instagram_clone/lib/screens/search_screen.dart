import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/models/user_repository.dart';
import 'package:instagram_clone/screens/pofile_screen.dart';
import 'package:instagram_clone/services/database_service.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key key,
    this.onTextChanged,
  }) : super(key: key);

  final void Function(String) onTextChanged;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _users;
  
  _buildUserTile(User user) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: user.profileImageUrl.isEmpty ? AssetImage('assets/images/boy.png') : CachedNetworkImageProvider(user.profileImageUrl)),
        title: Text(user.name),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(userId: user.id),
            )
        )
    );
  }

//  List<User> _searchUsers = [];

//  @override
//  void initState() {
//    super.initState();
//    _searchUsers = UserRepository.findAllByName("");
//    _searchController.addListener(() => widget.onTextChanged != null ? widget.onTextChanged(_searchController.text) : null);
//  }

//  _onChanged(String value) {
//    setState(() {
//      _searchUsers = UserRepository.findAllByName(value);
//    });
//  }

  _clearSearch() {
    print("clear");
    WidgetsBinding.instance.addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
//              onPressed: () {
//                WidgetsBinding.instance.addPostFrameCallback((_) => _searchController.clear());
//                _onChanged('');
//              }
              onPressed: _clearSearch,
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            if (input.isNotEmpty) {
              setState(() {
                _users = DatabaseService.findAllUsersByName(input);
              });
            }
          },
//          onChanged: _onChanged,
        ),
      ),
      body: _users == null
          ? Center(
              child: Text('Search for a user'),
            )
          : FutureBuilder(
              future: _users,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data.documents.length == 0) {
                  return Center(child: Text('No users found'),);
                }

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = User.fromDoc(snapshot.data.documents[index]);
                      return _buildUserTile(user);
                    }
                );
              },
            )
//      body: Column(
//        children: <Widget>[
//          (_searchUsers != null && _searchUsers.length != 0)
//              ? Expanded(
//                  child: ListView(
//                    padding: EdgeInsets.all(10.0),
//                    children: _searchUsers.map((user) {
//                      return ListTile(
////                          leading: Icon(Icons.map),
//                          leading: CircleAvatar(radius: 20.0, backgroundImage: AssetImage('assets/images/boy.png'),),
//                          title: Text(user.name),
//                          onTap: () => Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (_) => ProfileScreen(userId: user.id),
//                              ))
//                      );
//                    }).toList(),
//                )
//              )
//              : SizedBox(),
//        ],
//      )
    );
  }

}
