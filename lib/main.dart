import 'package:flutter/material.dart';
import 'package:ShouldYouEat/front_end/add.dart';
import 'package:ShouldYouEat/front_end/goals.dart';
import 'package:ShouldYouEat/front_end/home.dart';
import 'package:ShouldYouEat/front_end/log.dart';
import 'package:ShouldYouEat/front_end/settings.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/':(context)=>Home(),
      '/log':(context)=>Log(),
      '/add':(context)=>Add(),
      '/goals':(context)=>Goals(),
      '/setting':(context)=>Settings(),
    }
  ));
}