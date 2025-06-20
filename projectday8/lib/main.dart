import 'package:flutter/material.dart';
import 'package:projectday8/pages/bottom_app_bar_page.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigation Bar',
      home:BottomAppBarPage() ,
    );
  }
}
