import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TimelineModel> items=[
    TimelineModel(Card(
      child:ListTile(
        isThreeLine: true,
        leading:Icon(
          Icons.fastfood
        ),
        title: Text("Burger"),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  Text("22/10/2020"),
                  Text("Unhealthy",
                  style:TextStyle(
                    color:Colors.red,
                  )
                  ),
          ],
        )
      )
    ),
      position: TimelineItemPosition.left,
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.blur_circular)
    ),
    TimelineModel(
        Card(
          child:ListTile(
              isThreeLine: true,
              leading:Icon(Icons.fastfood),
              title: Text("French Fries"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("23/10/2020"),
                  Text("Unhealthy",
                  style:TextStyle(
                    color:Colors.red,
                  )
                  ),
                ],
              )
              
          )
        ),
        position: TimelineItemPosition.random,
        iconBackground: Colors.blueAccent,
        icon: Icon(Icons.blur_circular)
    ),
    TimelineModel(
        Card(
          child:ListTile(
              isThreeLine: true,
              leading:Icon(Icons.fastfood),
              title: Text("Pasta"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("24/10/2020"),
                  Text("Healthy",
                  style:TextStyle(
                    color:Colors.green,
                  )
                  ),
                ],
              )
          )
        ),
        position: TimelineItemPosition.random,
        iconBackground: Colors.purpleAccent,
        icon: Icon(Icons.blur_circular)
    ),
  ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: PreferredSize(
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
                Text('ShouldYouEat???'),
              ],
            ),
            Text("What you have eaten recently?"),
          ],
        ),
      ),),
      backgroundColor: Color(0xff43a047),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Timeline(
          children: items,
          position: TimelinePosition.Left,
        ),
      ),
      bottomNavigationBar:ConvexAppBar(
        backgroundColor: Color(0xff66BB6A),
        items: [
          TabItem(
            icon: Image.asset('assets/images/home.png'),
            title:'Home',
          ),
          TabItem(
            icon: Image.asset('assets/images/add.png'),
            title:'Add',
          ),
          TabItem(
            icon: Image.asset('assets/images/goals.png'),
            title:'Goals',
          ),
        ],
        initialActiveIndex: 0,
        onTap: (int i){
          if(i==2){
            Navigator.pushNamed(context, '/goals');
          }
          if(i==1){
            Navigator.pushNamed(context, '/add');
          }
        },
        ),
    );
  }
}