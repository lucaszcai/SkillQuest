import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:skill_quest/models/skill_result.dart';



Future<SkillResult> fetchSkillResult(String text) async {

  String url = 'http://192.168.0.120:8080/skill/?skill='+text;
  print(url);
  Response response = await get(url);
  // sample info available in response
  //int statusCode = response.statusCode;
  print(response.body);
  SkillResult footprintResult = SkillResult.fromJson(json.decode(response.body));

  print(footprintResult);
  return footprintResult;

}