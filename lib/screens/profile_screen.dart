import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

_toolBar() {
  return Padding(
    padding: EdgeInsets.all(32.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        Text(
          '@lucascaixizang',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        )
      ],
    ),
  );
}

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
                child: Image.network(
                  "https://images.unsplash.com/photo-1527632756259-26693f831311?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80",
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0x0041444B),
                      Color(0x6041444B),
                    ],
                  )),
                )),
            Positioned(
              top: 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _toolBar(),
                  _body(),
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
        //_profilePosts(),
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
          "Recorder Master",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    ),
  );
}
