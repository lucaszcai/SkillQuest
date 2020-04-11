import 'package:flutter/material.dart';
import 'package:skill_quest/screens/skill_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> currentSkills = ["Learn Recorder", "Learn Crochet", "Music Composition",];
  List<String> newSkills = ["Learn Recorder", "Learn Crochet", "Music Composition", "Ride a bike", "Solve a Rubik's Cube"];

  int _index = 0;
  //List<String> locationsImgs = ["assets/images/1.jpg", "assets/images/2.jpg", "assets/images/3.jpg", "assets/images/1.jpg"];

  Widget _buildSkill(String skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 75.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: new Color(0xffEDE9EF),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    skill,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    "3 days",
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
    );
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
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                  'Let\'s learn a new skill',
                  style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 45.0,),

              //skills currently being learned
              Text(
                'Skills you\'re learning',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 20.0,),


              //carousel that changes size and stuff
              SizedBox(
                height: 200, // card height
                child: PageView.builder(
                  itemCount: currentSkills.length,
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SkillScreen())),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                  height: 200,
                                  width: 300,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    //child: Image(image: Image.network(imageUrls[i]).image,
                                      //fit: BoxFit.cover,),
                                    child: Image.asset('assets/images/recorderplayer.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ),
                              Center(
                                    child: Text(
                                      currentSkills[i],
                                      style: TextStyle(fontSize: 32, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),

                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20.0,),

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
