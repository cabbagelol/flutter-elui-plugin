/**
* vacancy
*/

import 'package:flutter/material.dart';

class EluiVacancyComponent extends StatefulWidget {
  final String title;
  final Widget cont;

  EluiVacancyComponent({this.title, this.cont});

  @override
  _EluiVacancyComponentState createState() => _EluiVacancyComponentState();
}

class _EluiVacancyComponentState extends State<EluiVacancyComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Text(widget.title??'空空如也', style: TextStyle(
            fontSize: 12,
            color: Color(0xff555555)
          )),
          widget.cont??Container()
        ],
      ),
    );
  }
}
