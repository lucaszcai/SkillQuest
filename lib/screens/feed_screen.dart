import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_quest/models/post.dart';
import 'package:skill_quest/models/user.dart';
import 'package:skill_quest/widgets/feedtile.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {


  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    getAllPosts();
    //print('hello');
  }

  Future getAllPosts() async{
    Firestore.instance.collection('posts').getDocuments().then((snapshot){
      for (DocumentSnapshot ds in snapshot.documents){
        setState(() {
          posts.add(Post.fromMap(ds.data));
        });
      }
    });

  }

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
          Container(
            height: posts.length * 510.0,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return getFeedTile(index);
                },
              ),

          ),
        ],
      ),
    );
  }

  Future likePost(int timestamp) async{

    print("TIMESTAMP"+timestamp.toString());
    Firestore.instance.collection('posts').getDocuments().then((snapshot) async {
      print("ACCESSED");
      for (DocumentSnapshot ds in snapshot.documents){
        print("INSIDE");
        if(ds.data['datetime'] == timestamp){
          print("FOUND");
          int count = ds.data['total']+1;
          await Firestore.instance.collection('posts').document(ds.documentID).updateData({'total':count});
        }
      }
    });
  }

  Future<User> getUserFromUid(String uid) async{
    Firestore.instance.collection('users').getDocuments().then((snapshot){
      for (DocumentSnapshot ds in snapshot.documents){
        setState(() {
          posts.add(Post.fromMap(ds.data));
        });
      }
    });
  }

  Widget getFeedTile (int index){

    print(posts[0].image);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 500,
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
                            child:  Image(image: Image.network(posts[index].image).image,
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      title: Text(
                        'Vincent Do',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(timeago.format(DateTime.fromMillisecondsSinceEpoch(posts[index].datetime))),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: Colors.black45,
                        onPressed: () => print('More'),
                      ),
                    ),
                    Text(posts[index].description),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 300,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(image: Image.network(posts[index].image).image,
                            fit: BoxFit.cover,),),
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
                                    onPressed: () {
                                      print("LIKED!");
                                      likePost(posts[index].datetime);
                                    }
                                  ),
                                  Text(
                                    posts[index].total.toString(),
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
                                color: Colors.orangeAccent.withOpacity(0.4),
                                icon: Icon(Icons.add_circle),
                                label: Text('Learn this!'),
                                splashColor: Colors.orangeAccent,
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
