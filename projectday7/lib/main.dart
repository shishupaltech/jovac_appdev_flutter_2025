import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  int age = 20;
  final double price = 2323.23;
  final String name = "Shishupal Singh";
  final bool value = true;
  var person = 25;
  dynamic myvalue = 'karan';
  List<String> list= ["Apple","Banana","Mango","karan","soniya"];

  @override
  Widget build(BuildContext context) {
    myvalue  = 23;
    return MaterialApp(
      title: 'Project Day 7',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data types in UI'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$age'),
              Text('$price'),
              Text('$name'),
              Text("Is Student? bool ${value? "yes" : "No" }"),
              Text("$person"),
              Text("$myvalue"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:list.map((fruit)=>Text("$fruit")).toList(),
              )

            ],
          ),
        ),
      ),
    );
  }
}
