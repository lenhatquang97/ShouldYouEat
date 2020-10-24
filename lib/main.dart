import 'package:ShouldYouEat/front_end/result.dart';
import 'package:flutter/material.dart';
import 'package:ShouldYouEat/front_end/add.dart';
import 'package:ShouldYouEat/front_end/home.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      //Test something on liveshare
      '/result':(context)=>Result(),
      '/':(context)=>Home(),
      '/add':(context)=>Add(),
    }
  ));
}