/**
 * 功能：input
 * 描述：
 * By 向堂 2019/8/27
 */

import 'package:flutter/material.dart';

class EluiInputComponent extends StatelessWidget {
  final String title;
  final String value;
  final String placeholder;
  final Widget icon;
  final Widget right;

  EluiInputComponent(
      {Key key,
      this.title,
      this.value,
      this.placeholder,
      this.icon,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
                margin: EdgeInsets.only(right: 10),
                child: icon,
              ) ??
              Container(),
          Text(title ?? ''),
          Expanded(
            flex: 1,
            child: Input(
                placeholder: placeholder
            ),
          ),
          right ?? Container()
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  final placeholder;

  Input({
    this.placeholder
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: placeholder,
        border: InputBorder.none,
        fillColor: Colors.transparent,
        filled: false,
        hasFloatingPlaceholder: false,
      ),
    );
  }
}