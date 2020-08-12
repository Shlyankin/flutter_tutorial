

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello_world/lesson6/SandGlass.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (BuildContext context) => TimerScreen()
      },
    )
  );
}

class TimerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TimerScreenState();
}

class TimerScreenState extends State<TimerScreen> {
  SandGlass _timer = SandGlass();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    _timer.tick();
    super.initState();
  }

  _reDraw() async {
    if (_timer.time() == 0) return;
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _reDraw();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Lesson 6")),
      body: Center(child: Column(
        children: [
          Text("Время: ${_timer.time()}", style: TextStyle(fontSize: 20.0)),
          RaisedButton(child: Text("Рестарт", style: TextStyle(fontSize: 20.0)), onPressed: () {
            if (_timer.time() != 0)
              _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text("Таймер еще не закончил работу"), backgroundColor: Colors.red));
            else {
              setState(() {
                _timer.tick();
              });
            }
          },)
        ],
      )
    ));
  }

}