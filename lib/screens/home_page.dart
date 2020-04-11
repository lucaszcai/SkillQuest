import 'package:flutter/material.dart';
import 'package:skill_quest/screens/feed_screen.dart';
import 'package:skill_quest/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  var _pageOptions = [
    HomeScreen(),
    FeedScreen(),
    //ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomePage')),
    );
  }
}
