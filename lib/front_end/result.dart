import 'package:flutter/material.dart';
import 'package:ShouldYouEat/back_end/food_data.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}
class _ResultState extends State<Result> {
  Future<Food>foo;
  Food food;
  String apiKey='edf75d9abe2049cb9f79f8e873188e10';
  String title='pizza';
  @override
  void initState(){
    super.initState();
    foo=fetchFood(apiKey,title);
  }
  @override
  
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor:Color(0xff2e7d32),
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Food>(
            future: foo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('pizza');
                print(snapshot.data.calories);
                print(snapshot.data.fat);
                print(snapshot.data.carbs);
                print(snapshot.data.protein);
                return Text('Hello world');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}