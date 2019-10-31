/**
 * 功能：textarea 多行文本框
 * 描述：
 * By 向堂 2019/9/2
 */

import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/_input/index.dart' show Input;

class EluiTextareaComponent extends StatefulWidget {
  final String title;

  final Map data;

  final String value;

  final int maxLines;

  final int maxLength;

  final String placeholder;

  final Color color;

  final Function onChange;

  EluiTextareaComponent({
    this.title,
    this.data,
    this.value = "",
    this.maxLines = 8,
    this.maxLength,
    this.placeholder = '请输入内容',
    this.color = const Color(0xffeeeeee),
    this.onChange,
  });

  @override
  _EluiTextareaComponentState createState() => _EluiTextareaComponentState();
}

class _EluiTextareaComponentState extends State<EluiTextareaComponent> {
  static String _value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.title != null
              ? Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff555555),
                    ),
                  ),
                )
              : Container(),
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              decoration: new BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                border: new Border.all(width: 1, color: widget.color),
              ),
              child: Stack(
                children: <Widget>[
                  Input(
                    placeholder: widget.placeholder,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    onChange: (val_) {
                      setState(() {
                        _value = val_["value"];
                      });
                      widget.onChange({"value": val_["value"], "data": widget.data});
                    },
                  ),
                  widget.maxLength != null
                      ? Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            color: widget.color,
                            child: Text(
                              "剩余${widget.maxLength - _value.toString().length}字",
                            ),
                          ))
                      : Container()
                ],
              )),
        ],
      ),
    );
  }
}
