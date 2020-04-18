import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';

class TodoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String keyValue;

  TodoWidget({this.keyValue, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      margin: const EdgeInsets.all(10),
//      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
          color: darkRedAccentColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: <Widget>[
          Radio(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: darkTodoTitle,),
              Text(subtitle, style: darkTodoSubtitle,)
            ],
          ),
        ],
      ),
    );
  }
}
