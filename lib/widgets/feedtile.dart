import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 460,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        'Vincent Do',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('3 min ago'),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: Colors.black45,
                        onPressed: () => print('More'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        // IMAGE GOES HERE
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.favorite_border),
                                    iconSize: 30,
                                    onPressed: () => print('Like Post'),
                                  ),
                                  Text(
                                    '4202',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 10,),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.chat),
                                    iconSize: 30,
                                    onPressed: () => print('Comment'),
                                  ),
                                  Text(
                                    '62',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              child: FlatButton.icon(
                                color: Colors.blue.withOpacity(0.5),
                                icon: Icon(Icons.save_alt),
                                label: Text('Learn this!'),
                                splashColor: Colors.white,
                                onPressed: () {

                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
