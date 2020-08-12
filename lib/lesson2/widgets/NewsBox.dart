
import 'package:flutter/material.dart';
import 'package:flutter_hello_world/lesson2/widgets/NewsBoxFavourite.dart';

class NewsBox extends StatelessWidget {

  final String _title;
  final String _text;
  String _imageUrl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text, {String imageurl, int num = 0, bool like = false} ) {
    _imageUrl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl == null || _imageUrl.isEmpty) {
      return noImage();
    } else {
      return withImage();

    }
  }

  Widget withImage() {
    return Container(
      color: Colors.white,
      height: 100.0,
      child: Row(
        children: [
          Image.network(_imageUrl, width: 100.0, height: 100.0, fit: BoxFit.cover),
          Expanded(child: Container(padding: EdgeInsets.all(5.0),
              child: Column( children: [
                Text(_title, style: TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
                Expanded(child: Text(_text, softWrap: true, textAlign: TextAlign.justify))
              ]
              )
          ),
          )
        ],
      ),
    );
  }

  Widget noImage() {
    return Container(
      color: Colors.white,
      height: 100.0,
      child: Row(
        children: [
          Expanded(child: Container(padding: EdgeInsets.all(5.0),
              child: Column( children: [
                Text(_title, style: TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
                Expanded(child: Text(_text, softWrap: true, textAlign: TextAlign.justify))
              ]
              )
          ),
          ),
          NewsBoxFavourite(_num, _like)
        ],
      ),
    );
  }
}