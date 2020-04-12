import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_quest/models/skill_result.dart';
import 'package:skill_quest/screens/api_client.dart';
import 'package:skill_quest/screens/post_page.dart';
import 'package:skill_quest/utilities/skill_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_api/youtube_api.dart';

class SkillScreen extends StatefulWidget {
  SkillScreen({Key key, this.skill}) : super(key: key);
  final String skill;
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {

  int _index = 0;

  String curSkill = "play recorder";

  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    url = url.replaceAll(" ", "");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //TODO set up so that it takes you to the url on tap
  Widget _buildResource(int index) {
    if(index>10){
      return new SizedBox(
        height: 0,
        width: 0,
      );
    }
    String url = skillResources[index].url;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap:(){
          _launchURL(skillResources[index].url);
        },
        child: Container(
          height: 75.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: new Color(0xffEDE9EF),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:Center(
                    child: Text(
                        skillResources[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600
                        ),
              ),
                )
              ),
            ),
          ),
        ),
      )
    );
  }

  _addSkill(BuildContext context) async{

    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String getCategory(String skill){
      int ind = SkillConstants.skillNames.indexOf(skill);
      return SkillConstants.skillCategories[ind];
    }

    bool pass = true;


    Firestore.instance.collection('skills').getDocuments().then((snapshot) async {
      print("ACCESSED");
      for (DocumentSnapshot ds in snapshot.documents){
        print("INSIDE");
        if(ds.data['uid'] == user.uid&&ds.data['name']==widget.skill){
          pass=false;
        }
      }
      if(pass){
        await Firestore.instance.collection('skills').add({
          'uid':user.uid,
          'id':null,
          'completed': 0,
          'category':getCategory(widget.skill),
          'name': widget.skill,
          'datetime': DateTime.now().millisecondsSinceEpoch
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int ind = SkillConstants.skillNames.indexOf(widget.skill);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check,),
        backgroundColor: Colors.blue,
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage(skill: curSkill,)),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.red,
                    child: Image.network(SkillConstants.skillUrls[ind],fit: BoxFit.cover,)
                  ),
                  Positioned(
                    top: 15.0,
                    left: 10.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 30.0, color: Colors.white,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 15.0,
                    right: 10.0,
                    child: IconButton(
                      icon: Icon(Icons.add, size: 35.0, color: Colors.white,),
                      onPressed:(){
                        _addSkill(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              //title
              Text(
                  widget.skill,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
              ),
              //description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text(
                  SkillConstants.skillDescription[ind],
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),



              Text(
                  'Videos',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
              ),

              SizedBox(height: 10.0,),


              //video carousel
              SizedBox(
                height: 200, // card height
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.7),
                  onPageChanged: (int index) => setState(() => _index = index),
                  physics: BouncingScrollPhysics(),
                  itemCount: ytResult.length,
                  itemBuilder: (_, int index) => listItem(index)
                ),
              ),

              SizedBox(height: 20.0,),

              Text(
                'Resources',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Container(
                height:12 * 95.0,
                child: Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: skillResources.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildResource(index);
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void setSkill(){
    //TODO Set Curskill to a random skill

  }

  List<SkillResult> skillResources = [];
  @override
  void initState() {
    super.initState();
    curSkill = widget.skill;
    callAPI("How to "+curSkill);
    fetchSkillResult(curSkill).then((resources){
      setState(() {
        skillResources=resources;
      });
    });
    print('hello');
  }

  static String key = "AIzaSyAnWtZXDJ5w6akYcm97oBhCK9JC4Lq9abY";
  YoutubeAPI ytApi = new YoutubeAPI(key);
  List<YT_API> ytResult = [];

  callAPI(String query) async {
    print('UI callled');
    ytResult = await ytApi.search(query);
    print("URL"+ytResult[1].url);
    setState(() {
      print('UI Updated');
    });
  }

  Widget listItem(index){
    if(index>10){
      return new SizedBox(
        height: 0,
        width: 0,
      );
    }
    return Transform.scale(
      scale: index == _index ? 1 : 0.9,
      child: GestureDetector(
        onTap: () => _launchURL(ytResult[index].url),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: <Widget>[
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    //child: Image(image: Image.network(imageUrls[i]).image,
                    //fit: BoxFit.cover,),
                    child: Image.network(ytResult[index].thumbnail['default']['url'],fit: BoxFit.cover,),
                  )
              ),

              Positioned(
                bottom: 30,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

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
