import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:skill_quest/models/post.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key, this.skill}) : super(key: key);
  final String skill;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {



  File _image;
  TextEditingController _captionController = TextEditingController();
  String _caption = '';
  String description="I loved trying this skill out!";

  void initState() {
    super.initState();
  }


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });

    await uploadImage();
  }

  Future uploadImage() async {
    print(Path.basename(_image.path));
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("photos/${Path.basename(_image.path)}");
    StorageUploadTask upload = reference.putFile(_image);
    await upload.onComplete;
    print('complete');
  }



  _submit(BuildContext context) async {
    print("Starting to submit");
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String pic_url = await FirebaseStorage.instance
        .ref()
        .child("photos/${Path.basename(_image.path)}")
        .getDownloadURL();

    DocumentReference ref = await Firestore.instance.collection('posts').add({
      'uid':user.uid,
      'id':null,
      'image': pic_url,
      'description': description,
      'skill':widget.skill,
      'total': 0,
      'ratings': 0,
      'datetime': DateTime.now().millisecondsSinceEpoch
    });


    String getCategory(String skill){
      return "general";
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


    Navigator.pop(context);
    /*
    DocumentSnapshot snap =
    await Firestore.instance.collection('users').document(user.uid).get();
    List hold = snap['entries'];
    if (hold == null) {
      hold = new List();
    }
    hold.add(ref.documentID);
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .updateData({"entries": hold});
    Navigator.pop(context);
     */
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            color: Colors.black,
            onPressed: () => _submit(context),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    height: width,
                    width: width,
                    color: Colors.grey[300],
                    child: _image == null
                        ? Icon(
                      Icons.add_a_photo,
                      color: Colors.white70,
                      size: 150.0,
                    )
                        : Image(
                      image: FileImage(_image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _captionController,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      labelText: 'Caption',
                    ),
                    onChanged: (input) => description = input,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

}

/*
FlatButton(
        child: Text('Take PICTURE'),
        onPressed:(){
          getImage();
          _submit(context);
        },
      ),

 */