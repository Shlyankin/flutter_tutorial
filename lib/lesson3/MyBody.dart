
import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MyBodyState();

}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');

      if(i.isOdd) return Divider();

      final int index = i ~/ 2; // целочисленное деление

      print('index $index');
      print('length ${_array.length}');

      if (index >= _array.length) _array.addAll(['$index', '${index + 1}', '${index + 2}']);

      return ListTile(title: new Text(_array[index], style: TextStyle(fontSize: 20.0)));
    });
  }

}