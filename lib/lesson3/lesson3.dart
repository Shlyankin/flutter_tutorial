import 'package:flutter/material.dart';
import 'package:flutter_hello_world/lesson3/MyBody.dart';
import 'package:flutter_hello_world/lesson3/hometask.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(title: Text("Lesson 3")),
              body: HomeTask()
          )
      )
  );
}

class LessonPart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, num) {
          return Column(children: [
            Text("row $num", style: TextStyle(fontSize: 20.0)),
            Divider()
          ]);
        });
  }
}

class LessonPart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBody();
  }
}

class HomeTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeTaskWidget();
  }

}