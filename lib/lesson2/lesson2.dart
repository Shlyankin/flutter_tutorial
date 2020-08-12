import 'package:flutter/material.dart';
import 'package:flutter_hello_world/lesson2/widgets/NewsBox.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(title: Text("Lesson 2")),
              body: NewsBox('Новый урок по Flutter',
                  '''В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования. В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                  imageurl: 'https://flutter.su/favicon.png')
          )
      )
  );
}