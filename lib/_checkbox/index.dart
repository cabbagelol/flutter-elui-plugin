/**
 * 功能：checkbox 复选框
 * 描述：
 * By 向堂 2019/8/28
 */

import 'package:flutter/material.dart';

class EluiCheckboxComponent extends StatefulWidget {
  final Function onChanged;
  final Widget child;

  EluiCheckboxComponent({this.onChanged, this.child});

  @override
  _EluiCheckboxComponentState createState() => _EluiCheckboxComponentState();
}

class _EluiCheckboxComponentState extends State<EluiCheckboxComponent> {
  static bool _checkBoxSelected = false;

  _handleCheckBox(value) {
    setState(() {
      _checkBoxSelected = value;
    });
    widget.onChanged(_checkBoxSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          _handleCheckBox(_checkBoxSelected != true);
        },
        child: Row(
          children: <Widget>[
            Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _checkBoxSelected,
                onChanged: (value) {
                  _handleCheckBox(value);
                }),
            widget.child ?? Container()
          ],
        ),
      ),
    );
  }
}
