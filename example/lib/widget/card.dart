import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;

  Card({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
        child: child?? Container()
    );
  }
}