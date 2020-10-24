import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ShouldYouEat/front_end/home.dart';
class Goals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home())
          );
        }),
        backgroundColor:Color(0xff2e7d32),
        title: Text('Statistics'),),
      backgroundColor: Color(0xff43a047),
      body:Column(
        children:[
          SizedBox(height:8),
          Text('Food that has more calories',
          style:TextStyle(
            fontSize:30,
            fontWeight:FontWeight.bold,
          )
          ),
          SizedBox(
            height:400,
            width:400,
            child:PieChartBar(),
          )
        ],
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
        initialActiveIndex: 2,
        onTap: (int i){
          if(i==2){
            Navigator.pushNamed(context, '/goals');
          }
          if(i==1){
            Navigator.pushNamed(context, '/add');
          }
          if(i==0){
            Navigator.pushNamed(context, '/');
          }
        },
        ),
    );
  }
}
class PieChartBar extends StatefulWidget {
  @override
  _PieChartBarState createState() => _PieChartBarState();
}

class _PieChartBarState extends State<PieChartBar> {
  List<PieChartSectionData> _sections=List<PieChartSectionData>();
  void initState(){
    super.initState();
    PieChartSectionData _item1=PieChartSectionData(
      color:Colors.blueAccent,
      value:30,
      title:'Burger',
      radius:70,
      titleStyle: TextStyle(
        color:Colors.black,
        fontSize:20
      )
    );
    PieChartSectionData _item2=PieChartSectionData(
      color:Colors.redAccent,
      value:20,
      title:'French Fries',
      radius:70,
      titleStyle: TextStyle(
        color:Colors.black,
        fontSize:20
      )
    );
    PieChartSectionData _item3=PieChartSectionData(
      color:Colors.purpleAccent,
      value:30,
      title:'Rolls',
      radius:70,
      titleStyle: TextStyle(
        color:Colors.black,
        fontSize:20
      )
    );
    PieChartSectionData _item4=PieChartSectionData(
      color:Colors.yellowAccent,
      value:10,
      title:'Cake',
      radius:70,
      titleStyle: TextStyle(
        color:Colors.black,
        fontSize:20
      )
    );
    _sections=[_item1,_item2,_item3,_item4];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:AspectRatio(
        aspectRatio: 1,
        child:PieChart(
          PieChartData(
            sections: _sections,
            borderData: FlBorderData(show: false),
            centerSpaceRadius: 50,
            sectionsSpace: 0,
          )
        )
      )
    );
  }
}