import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// activity 2 is completed bro..
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'activity 2',
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Icon(Icons.arrow_back), Icon(Icons.more_vert)],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/shishupalsingh.jpeg',
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      children: [
                        Text(
                          'Shishupal Singh',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@Technical Trainer',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Just finished a fantastic hike in the mountains! '
                  'The views were breathtaking, and the fresh air was so invigorating. Feeling grateful for moments like these. #hiking #nature #mountains',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/mountain.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 16),
                        Text('23'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.comment_rounded),
                        SizedBox(width: 16),
                        Text('5'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.send),
                        SizedBox(width: 16),
                        Text('2'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('23 likes', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 16),
                Text('Liam Carter: Looks amazing: I need to plan a trip soon.'
                  ,style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Jessica Williams: You should, Liam! It\'s definitely worth it.',
                    style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/shishupalsingh.jpeg',
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 320,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Add a commnet...',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
