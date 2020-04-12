import 'package:flutter/material.dart';
import 'package:skill_quest/widgets/leaderboard_selector.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int userIndex = 0;
  int score = 1000;
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
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(180, 191, 209, 1),
                    Color.fromRGBO(180, 191, 209, .8)
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
              height: ScreenHeight * .68,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(180, 191, 209, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Text((index + 1).toString()),
                        title: Text(
                          users[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text((score - index).toString()),
                      ),
                    ),
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
