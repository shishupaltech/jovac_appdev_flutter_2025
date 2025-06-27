import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'about_screen.dart';
import 'contact_page.dart';

class HomeScreen extends StatelessWidget {
  final String sampleString = "Hello coming from HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Push worked with MaterialPageRoute'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AboutPage(
                sampleString: sampleString,
              )),
            ),
          ),
          ListTile(
            title:Text('PushNamed worked with route!..'),
            onTap: ()=> Navigator.pushNamed(
                context,
                '/about',
                arguments:1,
            ),
          ),
          ListTile(
            title:Text('PushReplacement worked with materialpageroute!..'),
            onTap: ()=> Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ContactPage()),
            ),
          ),
          ListTile(
              title:Text('PushReplacementNamed worked with route!..'),
              onTap: ()=> Navigator.pushReplacementNamed(
                  context,
                  '/contact')
          ),
          ListTile(
            title: Text('PushAndRemoveUntil worked with materialpageroute!..'),
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => AboutPage()),
                  (route) => false,
            ),
          ),
          ListTile(
            title: Text('PushNamedAndRemoveUntil worked with route!..'),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/about',
                  (route) => false,
            ),
          )
        ],
      ),
    );
  }
}