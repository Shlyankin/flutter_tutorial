import 'dart:math';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen()
      )
  );
}

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Lesson 5 Part 2 / Alert Dialogs")),
      body: Center(
        child: RaisedButton(child: Text("Загадать число"), onPressed: () async {
          Map<String, dynamic> data = await Navigator.push(context, PageRouteBuilder(
            opaque: false,
            // second and third param is animations
            pageBuilder: (BuildContext context, _, __) => MyPopup(),
            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(opacity: animation,
                  child: ScaleTransition(scale: animation, child: child));
            }
          ));
          if (data == null) return;
          String info = "";
          Color color = Colors.red;
          if (data["result"]) {
            info = "Ты угадал число ${data["secret"]}";
            color = Colors.green;
          } else {
            info = "Ты НЕ угадал число ${data["secret"]}";
            color = Colors.red;
          }
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(info), backgroundColor: color, duration: const Duration(seconds: 1),));
        },),
      ),
    );
  }

}


class MyPopup extends StatelessWidget{
  int _number = Random().nextInt(10);
  int _user_answer;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Form(key: _formKey,
        child: Column(
          children: [
            Text("Ваш ответ (0-9):"),
            Container(height: 60.0,
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  validator: (value) {
                if (isNumeric(value)) {
                  _user_answer = int.parse(value);
                  if (_user_answer > 10 || _user_answer < 0) return "Введите число от 0 до 9";
                  return null;
                }
                else return "Введите число!";
              }
              ),)
          ],
        )
      ),
      actions: [
        FlatButton( child: Text("Проверить"),
          onPressed: () {
            if (_formKey.currentState.validate()) Navigator.pop(context, {"result": _user_answer==_number, "secret": _number});
          },
        ),
        FlatButton( child: Text("Отмена"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}