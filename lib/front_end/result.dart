import 'package:flutter/material.dart';
import 'package:ShouldYouEat/back_end/food.dart';
import 'package:ShouldYouEat/front_end/home.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}
class _ResultState extends State<Result> {
  Food foo;
  String path;
  @override
  void initState(){
    super.initState();
    path='assets/data/predict_result.json';
  }
  @override
  
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        backgroundColor:Color(0xff2e7d32),
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Center(
          child: FutureBuilder(
            future: parseJson(path),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                foo=Food.fromJson(snapshot.data);
                print(foo.title);
                print(foo.ingrs);
                print(foo.recipe);
                return Column(
                  children: [
                    Text(foo.title),
                    SizedBox(height: 15,),
                    Text('Ingredients:'),
                    Text(foo.ingrs.join(',')),
                    SizedBox(height: 15,),
                    Text('Recipe:'),
                    Column(
                      children:foo.recipe.map((e) => 
                      new Text('-'+e)).toList(),
                    ),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>Home(food:foo)
                          )
                        );
                      },
                      child: Text('BACK'),
                    )
                  ],
                );
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