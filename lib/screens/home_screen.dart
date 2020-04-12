import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_quest/models/skill.dart';
import 'package:skill_quest/screens/skill_screen.dart';
import 'package:skill_quest/utilities/colors.dart';
import 'package:skill_quest/utilities/skill_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> currentSkills = [
    "Learn Recorder",
    "Learn Crochet",
    "Music Composition",
  ];
  List<String> newSkills = [
    "Learn Recorder",
    "Learn Crochet",
    "Music Composition",
    "Ride a bike",
    "Solve a Rubik's Cube"
  ];

  int _index = 0;
  //List<String> locationsImgs = ["assets/images/1.jpg", "assets/images/2.jpg", "assets/images/3.jpg", "assets/images/1.jpg"];
  List<Skill> skills = [];

  Future getUserSkills() async {
    String user = "";
    await FirebaseAuth.instance.currentUser().then((value) {
      user = value.uid;
      print("TASK COMPLETE");
    });
    await Firestore.instance
        .collection('skills')
        .getDocuments()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents) {
        if (ds.data['uid'] == user) {
          print('HELLO');
          setState(() {
            skills.add(Skill.fromMap(ds.data));
          });
        }
      }
    });

  }

  Widget _buildCurSkill(int index) {
    int ind = SkillConstants.skillNames.indexOf(skills[index].name);
    return Transform.scale(
      scale: index == _index ? 1 : 0.9,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SkillScreen(
                      skill: SkillConstants.skillNames[ind],
                    ))),
        child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  //child: Image(image: Image.network(imageUrls[i]).image,
                  //fit: BoxFit.cover,),
                  child: Image.network(
                    SkillConstants.skillUrls[ind],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  skills[index].name,
                  style: TextStyle(fontSize: 32, color: Colors.white),
                  textAlign: TextAlign.center,
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    getUserSkills();
  }



  Widget _buildSkill(String skill) {
    Random num = new Random();
    int a = num.nextInt(27);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SkillScreen(
                        skill: SkillConstants.skillNames[a],
                      ))),
          child: Container(
            height: 75.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                decoration: new BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius:
                            3.0, // has the effect of softening the shadow
                        spreadRadius:
                            2.0, // has the effect of extending the shadow
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          3.0, // vertical, move down 10
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        SkillConstants.skillNames[a],
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${SkillConstants.skillDuration[a]} days",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //text at the very top
              Text(
                'Hello, Lucas',
                style: TextStyle(
                    fontSize: 40.0,
                    color: darkPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Let\'s learn a new skill',
                style: TextStyle(
                  color: darkPrimaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              //skills currently being learned
              Text(
                'Skills you\'re learning:',
                style: TextStyle(
                  color: darkPrimaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              //carousel that changes size and stuff
              SizedBox(
                height: 200, // card height
                child: PageView.builder(
                  itemCount: skills.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, i) {
                    return _buildCurSkill(i);
                  },
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: newSkills.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildSkill(newSkills[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
