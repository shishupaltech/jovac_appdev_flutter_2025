import 'package:flutter/material.dart';
import 'data_sending.dart';
class AboutPage extends StatelessWidget {
  final dynamic sampleString;
  const AboutPage({super.key, this.sampleString});

  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = sampleString ?? ModalRoute.of(context)?.settings.arguments ;
    return Scaffold(
      appBar: AppBar(title: Text('About Page'), centerTitle: true),
      body: Center(
          child: Column(
              children: [
                Text('$receivedData'),
                ElevatedButton(onPressed: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_)=>DataSending(data:1))
                ), child: Text('Send Data'))
              ]
          )
      ),
    );
  }
}