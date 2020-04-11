import 'package:flutter/material.dart';
import 'package:skill_quest/widgets/feedtile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.01),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Your Feed',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shuffle),
                      iconSize: 25,
                      onPressed: () => print('Shuffle Feed'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        icon: Icon(Icons.add_box),
                        iconSize: 25,
                        onPressed: () => print('Add Update'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FeedTile(),
          FeedTile(),
        ],
      ),
    );
  }
}
