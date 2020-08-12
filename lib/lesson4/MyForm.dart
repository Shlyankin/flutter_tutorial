import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();

}

enum GenderList {male, female}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(5.0),
          child: Form(key: _formKey,
                child: Column(
                  children: [
                    Text("имя пользователя", style: TextStyle(fontSize: 20.0)),
                    TextFormField(validator: (value) {
                      return value.isEmpty ? "Введите свое имя" : null;
                    },),
                    Text("Контактный E-mail", style: TextStyle(fontSize: 20.0)),
                    TextFormField(validator: (value) {
                      if(value.isNotEmpty && isEmail(value)) return null;
                      return "Это не email";
                    },),
                    Text("Ваш пол:", style: TextStyle(fontSize: 20.0)),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(title: Text("Мужской", style: TextStyle(color: Colors.blue),), value: GenderList.male, groupValue: _gender,
                              onChanged: (GenderList value) {
                                setState(() {
                                  _gender = value;
                                });
                              })

                        ),
                        Expanded(
                          child: RadioListTile(title: Text("Женский", style: TextStyle(color: Colors.pink)), value: GenderList.female, groupValue: _gender,
                              onChanged: (GenderList value) {
                                setState(() {
                                  _gender = value;
                                });
                              })
                        )
                      ],
                    ),
                    CheckboxListTile(
                      value: _agreement,
                      title: Text('Я ознакомлен'+(_gender==null?'(а)':_gender==GenderList.male?'':'а')+' '
                            'с документом "Согласие на обработку персональных данных" и даю согласие на обработку'
                            ' моих персональных данных в соответствии с требованиями "Федерального закона '
                            'О персональных данных № 152-ФЗ".', textAlign: TextAlign.justify,),
                      onChanged: (bool value) => setState(() => _agreement = value),),

                    SizedBox(height: 20.0),
                    RaisedButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()) {
                            Color messageColor = Colors.red;
                            String message;
                            if (_gender == null) message = "Выберите свой пол";
                            else if (_agreement == false) message = "Необходимо принять условия соглашения";
                            else {
                              messageColor = Colors.green;
                              message = "Форма успешно заполнена";
                            }

                            Scaffold.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: messageColor));
                          }
                          },
                        child: Text("Проверить"),
                        color: Colors.blue, textColor: Colors.white),
                ],)
          )
    );
  }

}