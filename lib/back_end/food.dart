import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
Future<String>_loadFromAsset(String str) async {
  return await rootBundle.loadString(str);
}

Future parseJson(String str) async {
    String jsonString = await _loadFromAsset(str);
    return jsonDecode(jsonString);
}
Future<Food> fetchFoodfromAPI(String apiSite) async{
  final response=await http.get(apiSite);
  if(response.statusCode==200){
    return Food.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to retrieve food');
  }
}

class Food{
  String title;
  List<String> recipe;
  List<String> ingrs;
  Food({@required this.title,@required this.recipe,@required this.ingrs});
  factory Food.fromJson(Map<String,dynamic> json){
    return Food(
      title:json['title'],
      recipe:json['recipe'],
      ingrs:json['ingrs'],
    );
  }
  Map<String,dynamic> toJson()=> {
    'title':title,
    'recipe':recipe,
    'ingrs':ingrs
  };
  Future<File> writeJson(Food food) async{
  
  }
}