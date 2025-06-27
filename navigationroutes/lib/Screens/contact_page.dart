import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Page'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            children: [
              Text(''),
              ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('Back'))
            ],

          )
      ),
    );
  }
}