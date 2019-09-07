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
  final TextInputType type;
  final bool Internalstyle;
  final int maxLenght;
  final Function onChanged;
  
  EluiInputComponent({
    Key key,
    this.title,
    this.value,
    this.placeholder = '',
    this.icon,
    this.right,
    this.type,
    this.maxLenght = null,
    this.Internalstyle,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Internalstyle != null ? EdgeInsets.all(0) : EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
      child: Row(
        children: <Widget>[
          icon != null ? Container(
            margin: EdgeInsets.only(right: 10),
            child: icon,
          ) : Container(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(title ?? ''),
          ),
          Expanded(
            flex: 2,
            child: Input(
              placeholder: placeholder,
              value: value,
              maxLength: maxLenght,
              maxLengthEnforced: true,
              onChanged: (value_) {
                onChanged({
                  "value": value_
                });
              }
            ),
          ),
          right ?? Container()
        ],
      ),
    );
  }
}

class Input extends StatefulWidget {
  final focusNode;
  final placeholder;
  final maxLines;
  final maxLength;
  final contentPadding;
  final value;
  final type;
  final maxLengthEnforced;
  final Function onChanged;

  Input({
    this.focusNode,
    this.placeholder,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding = const EdgeInsets.all(0),
    this.value,
    this.type = TextInputType.text,
    this.maxLengthEnforced = true,
    this.onChanged
  });

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  // 控制器
  final _name = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
//    widget._name.text = widget.value;
    return Container(
      child: TextField(
        focusNode: widget.focusNode,
        style: TextStyle(fontSize: 15),
        keyboardType: widget.type,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        maxLengthEnforced: widget.maxLengthEnforced,
        decoration: InputDecoration(
            hintText: widget.placeholder,
            border: InputBorder.none,
            fillColor: Colors.transparent,
            filled: false,
            hasFloatingPlaceholder: false,
            contentPadding: widget.contentPadding,
            counter: null,
            counterText: '',
        ),
        controller: _name,
        onChanged: (value_) {
          widget.onChanged({
            "value": value_
          });
        },
      ),
    );
  }
}