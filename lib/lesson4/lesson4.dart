

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello_world/lesson4/MyForm.dart';
import 'package:flutter_hello_world/lesson4/hometask.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Lesson 4")),
        body: AreaCalculatorWidget()
      ),
    )
  );
}