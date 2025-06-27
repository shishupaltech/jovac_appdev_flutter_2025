import 'package:flutter/material.dart';
class DataSending extends StatelessWidget {
  final dynamic data;
  const DataSending({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = data ?? ModalRoute.of(context)?.settings.arguments ?? "No Data";
    Widget diplayWidget;
    if(receivedData is String || receivedData is int){
      diplayWidget = Text(receivedData.toString());
    }else if(receivedData is List) {

      diplayWidget = Column(
        children: receivedData.map((item) => Text(item.toString())).toList(),
      );
    }else if(receivedData is Map){
      diplayWidget = Column(
        children: receivedData.keys.map((key) => Text('$key: ${receivedData[key]}')).toList(),
      );
    }else{
      diplayWidget = Text('Unsupported data type');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Sending data anything'),
        centerTitle: true,
      ),
      body: Center(
        child: diplayWidget,
      ),
    );
  }
}
