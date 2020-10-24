import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex=0;
    return Scaffold(
      backgroundColor: Color(0xff43a047),
      body:Column(
        children:[
          SizedBox(height:50),
          Row(
            children: [
              Image.asset('assets/images/rice-bowl.png'),
              Text('ShouldYouEat??',
                style:TextStyle(
                  fontSize:40,
                  fontWeight: FontWeight.bold,
              )
          ),
            ],
          ),
          Expanded(
            child:ListView.builder(
            itemCount: 1,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(15),
                child:Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.fromLTRB(0,40,0,0),
                child:ListTile(
                  onTap:(){},
                  title: Text('testing',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                  )
                )
                )
              );
            },
          ),
          )
        ],
      ),
      bottomNavigationBar:ConvexAppBar(
        items: [
          TabItem(
            icon: Image.asset('assets/images/home.png'),
            title:'Home',
          ),
          TabItem(
            icon: Image.asset('assets/images/log.png'),
            title:'Log',
          ),
          TabItem(
            icon: Image.asset('assets/images/add.png'),
            title:'Add',
          ),
          TabItem(
            icon: Image.asset('assets/images/goals.png'),
            title:'Goals',
          ),
          TabItem(
            icon: Image.asset('assets/images/settings.png'),
            title:'Settings',
          ),

        ]),
    );
  }
}