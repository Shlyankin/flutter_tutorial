import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen()
    )
  );
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lesson 5 / Main Screen")),
        body: Center(
          child: RaisedButton(child: Text("Открыть второе окно"), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },),
        )
    );
  }

}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lesson 5 / Second Screen")),
        body: Center(
          child: RaisedButton(child: Text("Открыть второе окно"), onPressed: () {
            Navigator.pop(context);
          },),
        )
    );
  }
}