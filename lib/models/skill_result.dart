import 'dart:math';

class SkillResult {
  final String url;
  final String title;

  SkillResult({this.url, this.title,});

  static int randval(int a){
    if(a!=null){
      return a;
    }
    Random r = new Random();
    if(r.nextInt(10)>5){
      return 10;
    }
    return null;
  }

  factory SkillResult.fromJson(Map<String, dynamic> json) {
    return SkillResult(
      url: json['url'],
      title:json['title'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return url.toString()+" "+title.toString();
  }

}