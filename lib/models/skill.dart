

class Skill {
  int id;
  String uid;
  int completed;
  int datetime;
  String category;
  String name;


  Skill({this.id, this.uid, this.completed, this.datetime, this.category, this.name});

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "completed": completed,
    "datetime":datetime,
    "category":category,
    "name":name,
  };

  factory Skill.fromMap(Map<String, dynamic> json) => new Skill(
    id: json["id"],
    datetime:json["datetime"],
    uid:json["uid"],
    completed:json["completed"],
    category: json["category"]
      ,name: json["name"]
  );

  @override
  String toString() {
    return 'Prayer{id: $id, uid: $uid, completed: $completed, datetime $datetime, category $category, name $name}';
  }

}