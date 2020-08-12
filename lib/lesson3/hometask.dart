
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTaskWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeTaskWidgetState();
  
}

class HomeTaskWidgetState extends State<HomeTaskWidget> {
  List<int> _items = [];
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      int index = i ~/ 2; // it is real index of showing _items
      if (index >= _items.length) _items.addAll([pow(index, 2).round(), pow(index + 1, 2).round(), pow(index + 2, 2).round()]);
      return ListTile(title: new Text("square of $index is ${_items[index]}", style: TextStyle(fontSize: 20.0)));
    });
  }
}