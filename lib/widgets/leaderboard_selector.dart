import 'package:flutter/material.dart';
import 'package:skill_quest/utilities/colors.dart';

class leaderboard_selector extends StatefulWidget {
  @override
  _leaderboard_selectorState createState() => _leaderboard_selectorState();
}

class _leaderboard_selectorState extends State<leaderboard_selector> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Friends',
    'Global',
    'Today',
    'Week',
    'Month',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          categories[index],
                          style: TextStyle(
                            color: index == selectedIndex
                                ? darkPrimaryColor
                                : darkPrimaryColor.withOpacity(0.5),
                            fontWeight: index == selectedIndex
                                ? FontWeight.bold
                                : FontWeight.w100,
                            letterSpacing: 1,
                            fontSize: 24
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
