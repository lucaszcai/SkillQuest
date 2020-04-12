import 'package:flutter/material.dart';
import 'package:skill_quest/models/skill_result.dart';
import 'package:skill_quest/screens/api_client.dart';
import 'package:skill_quest/screens/post_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_api/youtube_api.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {

  List<String> videos = ['How to play the recorder', 'recorder 101', 'recorder pro', 'recorder legend'];
  int _index = 0;

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
      child: Container(
        height: 75.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: new Color(0xffEDE9EF),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    skillResources[index].title,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        backgroundColor: Colors.blue,
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage()),
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
                    child: Image.asset(
                      'assets/images/recorderplayer.jpg',
                      fit: BoxFit.fill,
                    ),
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
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              //title
              Text(
                  'Recorder Playing',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
              ),
              //description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text(
                  'Learn how to actually play the instrument you got in second grade. The recorder has a surprisingly rich history!',
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
                height: skillResources.length * 75.0,
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

  List<SkillResult> skillResources = [];
  @override
  void initState() {
    super.initState();
    callAPI("How to play recorder");
    fetchSkillResult("play recorder").then((resources){
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
