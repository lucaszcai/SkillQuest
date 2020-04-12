import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_quest/models/user.dart';
import 'package:skill_quest/utilities/colors.dart';
import 'package:skill_quest/widgets/leaderboard_selector.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int userIndex = 0;

  List<User> users = [];
  var userScores = {};

  Future getAllUsers() async{
    await Firestore.instance.collection('users').getDocuments().then((snapshot){
      for(DocumentSnapshot ds in snapshot.documents){
        setState(() {
          users.add(User.fromMap(ds.data));
          //print(ds.data);
        });
      }
      print(users);
    });
  }

  Future getUserScore() async{
    print("helo");
    fillScoreMap();
    await Firestore.instance.collection('skills').getDocuments().then((snapshot){
      for(DocumentSnapshot ds in snapshot.documents){
        setState(() {
          print(userScores[ds['uid']]);
          userScores[ds['uid']]+=100;
        });
      }
    });
  }

  void fillScoreMap(){
    for(int i = 0; i < users.length; i++){
      setState(() {

        userScores[users[i].uid] = 0;
      });
    }
    print(users);
    print(userScores);
  }

  Future start() async{
    await getAllUsers();
    await getUserScore();
  }

  @override
  void initState(){
    super.initState();
    start();
  }


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
              height: ScreenHeight * .24,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      offset: Offset(5,10),
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                  gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        primaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'LEADERBOARD',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 35,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15,),
                  leaderboard_selector(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: ScreenHeight * .15,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(0,10),
                      spreadRadius: 1,
                      blurRadius: 10,
                    )
                  ],
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(20, 11, 106, 0.9),
                        Color.fromRGBO(20, 11, 106, 0.8)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'LEADERBOARD',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 37,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.15)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height:30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'LEADERBOARD',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 40,
                          //fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16)
                      ),
                      ),
                      height: ScreenHeight * .65,
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return ListTile(
                              leading: Icon(Icons.whatshot, color: Colors.amber, size: 60,),
                              title: Text(
                                users[index].name, style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                  userScores[users[index].uid].toString(), style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            );
                          }
                          else if(index == 1){
                            return ListTile(
                              leading: Icon(Icons.whatshot, color: Colors.grey, size: 50,),
                              title: Text(
                                users[index].name, style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                  userScores[users[index].uid].toString(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            );
                          }
                          else if(index == 2){
                            return ListTile(
                              leading: Icon(Icons.whatshot, color: Colors.brown.withOpacity(0.7), size: 40,),
                              title: Text(
                                users[index].name, style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                  userScores[users[index].uid].toString(), style: TextStyle(color: Colors.brown.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            );
                          }
                          else {
                            return ListTile(
                              leading: Text((index + 1).toString()),
                              title: Text(
                                users[index].name,
                              ),
                              trailing: Text(
                                  userScores[users[index].uid].toString()
                              ),
                            );
                          }
                        },
                      ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
