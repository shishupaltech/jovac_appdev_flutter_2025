import 'package:flutter/material.dart';

import 'Screens/about_screen.dart';
import 'Screens/contact_page.dart';
import 'Screens/data_sending.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator or Pages',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/senddata':(context)=>DataSending(),
        '/about': (context) => AboutPage(),
        '/contact':(context)=>ContactPage(),
      },
    );
  }
}






