import 'package:flutter/material.dart';
import 'package:ShouldYouEat/back_end/food.dart';
class Description extends StatelessWidget {
  Food food;
  Description({@required this.food});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Icon(Icons.arrow_back),
        title:Text(food.title),
      ),
      body:Column(
        children: [
          Placeholder(),
          Text(food.title),
          SizedBox(height: 15,),
          Text('Ingredients:'),
          Text(food.ingrs.join(',')),
          SizedBox(height: 15,),
          Text('Recipe:'),
          Column(
              children:food.recipe.map((e) => 
              new Text('-'+e)).toList(),
          )
        ],
      )
    );
  }
}