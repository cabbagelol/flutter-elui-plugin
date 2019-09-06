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
  
  EluiInputComponent({Key key,
    this.title,
    this.value,
    this.placeholder = '',
    this.icon,
    this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: icon,
          ) ??
              Container(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(title ?? ''),
          ),
          Expanded(
            flex: 2,
            child: Input(
              placeholder: placeholder,
              value: value
            ),
          ),
          right ?? Container()
        ],
      ),
    );
  }
}

class Input extends StatefulWidget {
  final placeholder;
  final maxLines;
  final maxLength;
  final contentPadding;
  final value;
  final Function onChanged;

  Input({
    this.placeholder,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding = const EdgeInsets.all(0),
    this.value,
    this.onChanged
  });

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  TextEditingController _name = TextEditingController();
  static var inputHeight = 0.0;

  void setValue(value_) {
    _name.text = value_;
  }

  @override
  void initState() {
    super.initState();
    this.setValue(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(fontSize: 15),
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        maxLengthEnforced: true,
        decoration: InputDecoration(
            hintText: widget.placeholder,
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: false,
            hasFloatingPlaceholder: false,
            contentPadding: widget.contentPadding,
            counter: null
        ),
        controller: _name,
        onChanged: (value_) {
          widget.onChanged(value_);
        },
      ),
    );
  }
}