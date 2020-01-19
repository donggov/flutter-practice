import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_app_ui/screens/detail_cost_screen.dart';
import 'package:story_app_ui/screens/detail_home_screen.dart';
import 'package:story_app_ui/screens/detail_plan_screen.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _currentTab = 0;
  Widget calledPage(int currentTab) {
    switch (currentTab) {
      case 0: return DetailHomeScreen(); break;
      case 1: return DetailCostScreen(); break;
      case 2: return DetailPlanScreen(); break;
      default: return DetailHomeScreen(); break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: calledPage(_currentTab),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        backgroundColor: Color(0xFF2d3447),
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
        activeColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 32.0,)),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money, size: 32.0,)),
          BottomNavigationBarItem(icon: Icon(Icons.today, size: 32.0,)),
          BottomNavigationBarItem(icon: Icon(Icons.create, size: 32.0,)),
        ],
      ),
    );
  }
}
