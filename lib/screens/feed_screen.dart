import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    SizedBox(width: 8,),
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
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10,),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            margin: EdgeInsets.all(10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0,2),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            //child: CircleAvatar(
                             // child: ClipOval(
                             //   child: Image(
                              //    height: 60,
                              //    width: 60,
                              //  ),
                            //  ),
                          //  ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
