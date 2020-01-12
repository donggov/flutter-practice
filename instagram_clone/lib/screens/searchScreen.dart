import 'package:flutter/material.dart';
import 'package:instagram_clone/models/userModel.dart';
import 'package:instagram_clone/models/user_repository.dart';
import 'package:instagram_clone/screens/pofileScreen.dart';

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
  List<User> _searchUsers = [];

  @override
  void initState() {
    super.initState();
//    _searchUsers = UserRepository.findAllByName("");
    _searchController.addListener(() => widget.onTextChanged != null ? widget.onTextChanged(_searchController.text) : null);
  }

  _onChanged(String value) {
    setState(() {
      _searchUsers = UserRepository.findAllByName(value);
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
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) => _searchController.clear());
                _onChanged('');
              }
            ),
            filled: true,
          ),
//          onSubmitted: (input) {
//            print(input);
//          },
          onChanged: _onChanged,
        ),
      ),
      body: Column(
        children: <Widget>[
          (_searchUsers != null && _searchUsers.length != 0)
              ? Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(10.0),
                    children: _searchUsers.map((user) {
                      return ListTile(
//                          leading: Icon(Icons.map),
                          leading: CircleAvatar(radius: 20.0, backgroundImage: AssetImage('assets/images/boy.png'),),
                          title: Text(user.name),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ProfileScreen(userId: user.id),
                          ))
                      );
                    }).toList(),
                  ),
                )
              : SizedBox(),
        ],
      )
    );
  }

}
