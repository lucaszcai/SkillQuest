import 'package:flutter/material.dart';
import 'package:skill_quest/screens/entry_screen.dart';
import 'package:skill_quest/screens/photo_test.dart';
import 'package:skill_quest/screens/youtube_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CameraTest(),
    );
  }
}
