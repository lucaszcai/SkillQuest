import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:skill_quest/models/skill_result.dart';



Future<List<SkillResult>> fetchSkillResult(String text) async {

  String url = 'http://192.168.0.200:8080/skill/?skill='+text;
  print(url);
  Response response = await get(url);
  // sample info available in response
  //int statusCode = response.statusCode;
  print(response.body);
  var j = json.decode(response.body);
  List<SkillResult> songs = [];
  for(Map<String, dynamic> m in j['body']){
    songs.add(SkillResult.fromJson(m));
  }

  print(songs);
  return songs;
}