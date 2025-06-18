import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Day 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.person),
          title: Text('Day 6'),
          actions: [

            Icon(Icons.login),
            SizedBox(width: 20,),
            Icon(Icons.logout),
            SizedBox(width: 20,),
          ],
          centerTitle: true,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          
        ),
        body: Column(
          children: [],
        ),
      ),

    );
  }
}
