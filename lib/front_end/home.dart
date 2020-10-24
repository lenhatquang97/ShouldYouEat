import 'package:ShouldYouEat/front_end/description.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:ShouldYouEat/back_end/food.dart';
class Home extends StatefulWidget {
  Food food;
  Home({@required this.food});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: foodAppBar(),
      backgroundColor: Color(0xff43a047),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Timeline(
          children: <TimelineModel>[
            TimelineModel(Card(
              child:ListTile(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                  builder:(context)=>Description(food: widget.food))
                );
              },
              isThreeLine: true,
              leading:Icon(
                Icons.fastfood
              ),
              title: Text(widget.food.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.food.ingrs.join(',')),
                ],
        )
      )
    ),
      position: TimelineItemPosition.left,
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.blur_circular)
    )
          ],
          position: TimelinePosition.Left,
        ),
      ),
      floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 70),
                child: Align(
                  alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                    onPressed: (){},
                    heroTag: "btn1",
                    // backgroundColor: Color(0XFF0D325E),
                    backgroundColor: Colors.red,
                    // child: Icon(Icons.refresh),
                    icon: Icon(Icons.camera),
                  ),
                ),
              ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
                onPressed: (){},
                heroTag: "btn2",
                backgroundColor: Colors.blue,
                icon:Icon(Icons.image)
                ),
            ),
        ],
      ),
    );
  }

  PreferredSize foodAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child:AppBar(
      leading:Image.asset('assets/images/rice-bowl.png'),
      backgroundColor:Color(0xff2e7d32),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('WhatYouEat???'),
            ],
          ),
          Text("What you have eaten recently?"),
        ],
      ),
    ),);
  }
}