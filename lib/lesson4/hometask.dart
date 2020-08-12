import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';

class AreaCalculatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AreaCalculatorState();

}

enum Metrics {mm, m}
extension MetricsExtension on Metrics {
  String getMetric() {
    switch (this) {
      case Metrics.m: return "мм";
      case Metrics.mm: return "м";
      default: return null;
    }
  }
}

class AreaCalculatorState extends State<AreaCalculatorWidget> {
  final _areaKey = GlobalKey<FormState>();
  Metrics _metrics = Metrics.m;
  final _metrics_listitem = [DropdownMenuItem(value: Metrics.m, child: Text(Metrics.m.getMetric())),
    DropdownMenuItem(value: Metrics.mm, child: Text(Metrics.mm.getMetric()))];
  double _height = 10.0;
  double _width = 10.0;
  double _area = 100.0;

  @override
  Widget build(BuildContext context) {
    return Form( key: _areaKey,
      child: Container(padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Text("Введите параметры квадрата", style: TextStyle(fontSize: 20.0),),
            Row(
              children: [
                Text("Единица измерения", style: TextStyle(fontSize: 20.0),),
                SizedBox(width: 10.0),
                DropdownButton(value: _metrics, items: _metrics_listitem, onChanged: (value) {
                  setState(() {
                    _metrics = value;
                  });
                },)
              ],
            ),
            Row(
                children: [
                  Text("Высота", style: TextStyle(fontSize: 20.0),),
                  SizedBox(width: 10.0),
                  Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child:TextFormField(
                        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                        initialValue: _height.toString(),
                        validator: (value) {
                          if (isFloat(value)) {
                            double numericValue = double.parse(value, (value) => -1.0);
                            if (numericValue < 0) return "Введите положительное число";
                            else {
                              _height = numericValue;
                              return null;
                            }
                          } else return "Введите число";
                          },
                      )
                  ))
                ]),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text("Ширина", style: TextStyle(fontSize: 20.0),),
                SizedBox(width: 10.0),
                Expanded(child: Container(padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                      initialValue: _width.toString(),
                      validator: (value) {
                        if (isFloat(value)) {
                          double numericValue = double.parse(value, (value) => -1.0);
                          if (numericValue < 0) return "Введите положительное число";
                          else {
                            _width = numericValue;
                            return null;
                          }
                        } else return "Введите число";
                      },
                    )
                ))
              ],
            ),
            SizedBox(height: 20.0),
            RaisedButton(onPressed: () {
              if (_areaKey.currentState.validate()) {
                setState(() {
                  _area = _height * _width;
                });
              }
            }, color: Colors.white, child: Text("посчитать", style: TextStyle(fontSize: 20.0, color: Colors.blue),),),
            SizedBox(height: 20.0),
            Text(_area == null ? "" : "Площадь квадрата: $_area ${_metrics.getMetric()}2", style: TextStyle(fontSize: 20.0))
          ],
        ),
      ));
  }

}