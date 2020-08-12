
import 'package:flutter/material.dart';

class NewsBoxFavourite extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavourite(this._num, this._like);

  @override
  State<StatefulWidget> createState() => NewsBoxFavouriteState(_num, _like);

}

class NewsBoxFavouriteState extends State<NewsBoxFavourite> {
  int num;
  bool like;

  NewsBoxFavouriteState(this.num, this.like);

  void pressLike() {
    setState(() {
      like = !like;
      if(like) num++;
      else num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("В избранном $num", textAlign: TextAlign.center),
        IconButton(icon: Icon(like ? Icons.star : Icons.star_border, size: 30.0), color: Colors.blue,onPressed: pressLike)
      ],
    );
  }

}