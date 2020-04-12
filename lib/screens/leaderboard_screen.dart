import 'package:flutter/material.dart';
import 'package:skill_quest/utilities/colors.dart';
import 'package:skill_quest/widgets/leaderboard_selector.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int userIndex = 0;
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
    'JAMES',
    'JOHN',
    'ROBERT',
    'MICHAEL',
    'WILLIAM',
    'DAVID',
    'RICHARD',
    'CHARLES',
    'JOSEPH',
    'JAMES',
    'JOHN',
    'ROBERT',
    'MICHAEL',
    'WILLIAM',
    'DAVID',
    'RICHARD',
    'CHARLES',
    'JOSEPH',
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
                  gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        primaryColor,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      'LEADERBOARD',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: 1,
                          color: darkPrimaryColor,
                          fontSize: 32,
                          //fontWeight: FontWeight.bold,
                          ),
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
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text((index+1).toString(), style: TextStyle(
                        color: darkPrimaryColor,
                      ),),
                      title: Text(
                        users[index],
                        style: TextStyle(
                          color: darkPrimaryColor,
                        ),
                      ),
                      trailing: Text("6969", style: TextStyle(
                        color: darkPrimaryColor,
                      ),),
                    );
                  },
                ),
            ),
          ),
        ],
      ),
    );
  }
}
