import 'package:flutter/material.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {

  List<String> videos = ['How to play the recorder', 'recorder 101', 'recorder pro', 'recorder legend'];
  int _index = 0;

  Widget _buildResource(String name) {
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
                    name,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600
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
                      icon: Icon(Icons.add, size: 30.0, color: Colors.white,),
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
                  itemCount: videos.length,
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
                                  //width: 150,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    //child: Image(image: Image.network(imageUrls[i]).image,
                                    //fit: BoxFit.cover,),
                                    child: Image.asset(
                                      'assets/images/recorderplayer.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                              Center(

                                    child: Text(
                                      videos[i],
                                      style: TextStyle(fontSize: 32, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),

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
                  },
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
                height: videos.length * 105.0,
                child: Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildResource(videos[index]);
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
}
