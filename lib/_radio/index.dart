/**
 * 功能：单选框
 * 描述：
 * By 向堂 2019/9/5
 */

import 'package:flutter/material.dart';

import '../_theme/index.dart';

class EluiRadioComponent extends StatefulWidget {
  final child;
  final checked;
  final value;
  final onChange;
  final color;

  final key = GlobalKey<EluiRadioComponentState>();

  EluiRadioComponent({
    Key key,
    this.child,
    this.checked = false,
    this.value,
    this.onChange,
    this.color
  });

  @override
  EluiRadioComponentState createState() => EluiRadioComponentState();
}

class EluiRadioComponentState extends State<EluiRadioComponent> {
  EluiTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = EluiUi.getTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          EluiRadioIComponent(
            checked: widget.checked,
              color: widget.color??theme.primaryColor
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: widget.child ?? Container(),
          )
        ],
      ),
      onTap: () {
        widget.onChange();
      },
    );
  }
}

class EluiRadioIComponent extends StatelessWidget {
  final checked;
  final color;


  EluiRadioIComponent({
    this.checked = false,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: checked
          ? Container(
        width: 20,
        height: 20,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 0, color: color),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      )
          : Container(
        width: 20,
        height: 20,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          border: Border.all(width: 0, color: color),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
