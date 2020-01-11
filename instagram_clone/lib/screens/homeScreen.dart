import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activityScreen.dart';
import 'package:instagram_clone/screens/createPostScreen.dart';
import 'package:instagram_clone/screens/feedScreen.dart';
import 'package:instagram_clone/screens/pofileScreen.dart';
import 'package:instagram_clone/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
          );
        },
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 32.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera, size: 32.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 32.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 32.0,)
          ),
        ],
      ),
    );
  }
}
