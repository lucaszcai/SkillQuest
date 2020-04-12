import 'package:flutter/material.dart';
import 'package:skill_quest/widgets/leaderboard_selector.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int user_index = 0;
  final List<String> users = [
    'JAMES',
    'JOHN',
    'ROBERT',
    'MICHAEL',
    'WILLIAM',
    'DAVID',
    'RICHARD',
    'CHARLES',
    'JOSEPH',
    'THOMAS',
    'CHRISTOPHER',
    'DANIEL',
    'PAUL',
    'MARK',
    'DONALD',
    'GEORGE',
    'KENNETH',
    'STEVEN',
    'EDWARD',
    'BRIAN',
    'RONALD',
    'ANTHONY',
    'KEVIN',
    'JASON',
    'MATTHEW',
    'GARY',
    'TIMOTHY',
    'JOSE',
    'LARRY',
  ];
  @override
  Widget build(BuildContext context) {
    final double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: ScreenHeight * .25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(20, 11, 106, 0.9),
                    Color.fromRGBO(20, 11, 106, 0.8)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      'LEADERBOARD',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: 1,
                          fontSize: 32,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  leaderboard_selector(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: ScreenHeight * .67,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(users[user_index++]),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
