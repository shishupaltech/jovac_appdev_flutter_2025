import 'package:flutter/material.dart';


class BottomAppBarPage extends StatefulWidget {

  @override
  State<BottomAppBarPage> createState() => _BottomAppBarPageState();
}

class _BottomAppBarPageState extends State<BottomAppBarPage> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: Text('Home',style: TextStyle(fontSize: 30),),
    ),
    Center(
      child: Text('Profile',style: TextStyle(fontSize: 30),),
    ),
    Center(
      child: Text('Explore',style: TextStyle(fontSize: 30),),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom App bar page'),
      ),
      body: _pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => {
          setState(() => currentIndex = value),
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'

          ),BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore'

          )
        ],
      ),
    );
  }
}
