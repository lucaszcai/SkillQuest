
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

/* _toolBar() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Text(
          '@lucascaixizang',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),

      ],
    ),
  );
}

 */


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Material(
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                )),

            Positioned(
                top: 0,
                bottom: 310,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1527632756259-26693f831311?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80",
                    )),
                ),
                ),
            Positioned(
              top: 190,
              bottom: 280,
              left: 100,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40, left: 10),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.white.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 15),
                    ],
                      color: Color(0xff6f3d2e),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      )
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //_toolBar(),
                  Expanded(
                  child: _body(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}

_body() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: _profileInfo(),
        ),
        _profilePosts(),
        _profileActionsAndInfo(),
      ],
    ),
  );
}


_profileInfo() {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "Lucas Cai",
          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          "@lucas_cai_zixiang",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
  );
}

_profilePosts() {
  return Container(
    width: 360,
    height: 200,
    child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _numberOfPosts();
          } else if (index == 7) {
            return _seeMorePosts();
          } else {
            return _profilePost(index);
          }
        }),
  );
}

_profileActionsAndInfo() {
  return Container(
    width: 360,
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          onPressed: () {},
          shape: StadiumBorder(),
          color: Colors.white,
          child: Text(
            "EDUCATION",
          ),
        ),
        Icon(
          Icons.school,
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: () {},
          shape: StadiumBorder(),
          color: Colors.white,
          child: Text(
            "MUSIC",
          ),
        ),
        Icon(
          Icons.music_note,
          color: Colors.black,
        )
      ],
    ),
  );
}

_numberOfPosts() {
  return Padding(
    padding: EdgeInsets.only(top: 45, bottom: 45, right: 10),
    child: Container(
      width: 85,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(5,10),
              spreadRadius: 1,
              blurRadius: 10,
            ),
            BoxShadow(color: Colors.white,
                offset: Offset(-3,-4),
                spreadRadius: -2,
                blurRadius: 20)
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "6",
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            Text(
              "SKILLS",
              style: TextStyle(fontSize: 14, color: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}


_profilePost(int index) {
  String profilePostImage = "";

  switch (index) {
    case 0:
      profilePostImage =
      "https://images.unsplash.com/photo-1466584241662-8cb021032c1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80";
      break;
    case 1:
      profilePostImage =
      "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
      break;
    case 2:
      profilePostImage =
      "https://images.unsplash.com/photo-1516641463285-bf3f40e65bae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
      break;
    case 3:
      profilePostImage =
      "https://images.unsplash.com/photo-1418290232843-5d7a0bd93f7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
      break;
    case 4:
      profilePostImage =
      "https://images.unsplash.com/photo-1581598681059-18f5871e1d48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
      break;
    case 5:
      profilePostImage =
      "https://images.unsplash.com/photo-1466584241662-8cb021032c1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80";
      break;
    default:
      profilePostImage =
      "https://images.unsplash.com/photo-1585521551675-64daba4ba31e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80";
      break;
  }

  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      width: 200,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Image.network(
          profilePostImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

_seeMorePosts() {
  return Padding(
    padding: EdgeInsets.only(top: 40, bottom: 40, left: 10),
    child: Container(
      width: 100,
      height: 110,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(-5,10),
              spreadRadius: 1,
              blurRadius: 10,
          )
        ],
          color: Colors.brown.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.arrow_forward_ios, color: Colors.black,),
            Text(
              "Explore More",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}
