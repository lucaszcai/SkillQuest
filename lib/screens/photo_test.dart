import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class CameraTest extends StatefulWidget {
  CameraTest({Key key}) : super(key: key);

  @override
  _CameraTestState createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {


  
  File _image;

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

    DocumentReference ref = await Firestore.instance.collection('entries').add({

    });
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
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: FlatButton(
        child: Text('Take PICTURE'),
      ),
    );
  }

}
