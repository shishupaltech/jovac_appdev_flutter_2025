import 'package:flutter/material.dart';
import 'package:projectday7/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    // Center(child: Text('Home', style: TextStyle(fontSize: 35))),
    Center(child: Text('Search', style: TextStyle(fontSize: 35))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 35))),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Day 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.person),
          title: Text('Day 6'),
          actions: [
            Icon(Icons.login),
            SizedBox(width: 20),
            Icon(Icons.logout),
            SizedBox(width: 20),
          ],
          centerTitle: true,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
        ),
        body: _pages[_currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.purple,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text('Hello')),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) => {
            setState(() {
              _currentIndex = value;
            }),
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Go to Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              tooltip: 'Go to Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              tooltip: 'Go to Profile',
            ),
          ],
        ),
      ),
    );
  }
}
