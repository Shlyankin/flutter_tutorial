import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (BuildContext context) => MainScreen(),
        "/second" : (BuildContext context) => SecondScreen(),
      }, onGenerateRoute: (routeSettings) {
        var path = routeSettings.name.split("/");
        if (path[1] == "second") {
          return MaterialPageRoute(builder: (context) => SecondScreen(id: path[2]), settings: routeSettings);
        }

    },
    )
  );
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lesson 5 / Main Screen")),
        body: Center(
          child: Column(
            children: [
              RaisedButton(child: Text("Открыть второе окно"), onPressed: () {
                Navigator.pushNamed(context, "/second");
              },),
              RaisedButton(child: Text("Открыть второе окно c значением 123"), onPressed: () {
                Navigator.pushNamed(context, "/second/123");
              },)
            ],
          )
        )
    );
  }

}

class SecondScreen extends StatelessWidget {

  String _id;
  SecondScreen({String id}) {
    _id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lesson 5 / Second Screen $_id")),
        body: Center(
          child: RaisedButton(child: Text("Вернуться назад"), onPressed: () {
            Navigator.pop(context);
          },),
        )
    );
  }
}