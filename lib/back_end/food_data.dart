import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
Future<Food> fetchFood(String apiKey, String title) async{
  final response=await http.get('https://api.spoonacular.com/recipes/guessNutrition?apiKey=$apiKey&title=$title');
  if(response.statusCode ==200){
    return Food.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load food');
  }
}
class Food{
  String apiKey;
  String title;
  double calories;
  double fat;
  double protein;
  double carbs;
  Food({this.apiKey,this.title,@required this.calories,@required this.fat, @required this.protein,@required this.carbs});
  
  factory Food.fromJson(Map<String,dynamic> json){
    return Food(
      calories: json['calories']['value'],
      fat:json['fat']['value'],
      protein:json['protein']['value'],
      carbs:json['carbs']['value']
    );
  }
}
