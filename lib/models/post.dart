

class Post {
  int id;
  String uid;
  String image;
  String description;
  String skill;
  int total;
  int ratings;
  int datetime;

  Post({this.id, this.uid, this.image, this.description, this. skill, this.total, this.ratings, this.datetime});

  Map<String, dynamic> toMap() =>{
    "id": id,
    "uid": uid,
    "image": image,
    "description": description,
    "skill": skill,
    "datetime":datetime,
    "total":total,
    "ratings":ratings,
    "total": total,
  };

  factory Post.fromMap(Map<String, dynamic> json) => new Post(
    id: json["id"],
    datetime:json["datetime"],
    skill:json["skill"],
    uid:json["uid"],
    image:json["image"],
    description:json["description"],
    total: json["total"],
    ratings: json["ratings"],
  );

  @override
  String toString() {
    return 'Prayer{id: $id, uid: $uid, image: $image, description: $description, skill: $skill, datetime $datetime, total: $total, ratings: $ratings}';
  }

}