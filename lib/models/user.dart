

class User {
  int id;
  String uid;
  String name;
  int datetime;
  String picurl;

  User({this.id, this.datetime, this.uid, this.name, this.picurl});

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "name": name,
    "picurl": picurl,
  };

  factory User.fromMap(Map<String, dynamic> json) => new User(
    id: json["id"],
    datetime:json["datetime"],

    uid:json["uid"],
    name:json["name"],
    picurl:json["picurl"],

  );

  @override
  String toString() {
    return 'User{id: $id, uid: $uid, name: $name, picurl: $picurl, datetime $datetime}';
  }

}