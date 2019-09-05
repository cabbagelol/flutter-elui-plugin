/**
 * 功能：checkbox 复选框
 * 描述：
 * By 向堂 2019/8/28
 */

import 'package:flutter/material.dart';


// 很难看版本
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

// 自定义
class CustomCheckBox extends StatefulWidget {
  // 是否是选中状态.
  bool isChecked;
  // 非选中状态icon.
  String nomalImagePath;
  // 选中状态icon.
  String checkedImagePath;
  // 选择后的构建
  CheckWidget onCheck;
  //左侧文本
  Text leftText;
  //右侧文本
  Text rightText;

  CustomCheckBox(
      {@required this.nomalImagePath,
        @required this.checkedImagePath,
        this.isChecked = true,
        this.onCheck,
        this.leftText,
        this.rightText});

  var state;

  @override
  State<StatefulWidget> createState() {
    state = CustomCheckBoxState(isChecked, nomalImagePath, checkedImagePath,
        onCheck, leftText, rightText);
    return state;
  }

  bool checked() {
    return state.isChecked;
  }
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked;
  String nomalImagePath;
  String checkedImagePath;
  CheckWidget onCheck;
  Text leftText;
  Text rightText;

  CustomCheckBoxState(
      bool isChecked,
      String nomalImagePath,
      String checkedImagePath,
      CheckWidget onCheck,
      Text leftText,
      Text rightText) {
    this.isChecked = isChecked;
    this.nomalImagePath = nomalImagePath;
    this.checkedImagePath = checkedImagePath;
    this.onCheck = onCheck;
    this.leftText = leftText;
    this.rightText = rightText;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new GestureDetector(
          child: new Row(
            children: <Widget>[
              (leftText != null) ? leftText : Text(''),
              new Image.asset(isChecked ? checkedImagePath : nomalImagePath),
              (rightText != null) ? rightText : Text(''),
            ],
          ),
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
            if (onCheck != null) {
              onCheck(isChecked);
            }
          },
        ));
  }
}

typedef CheckWidget = void Function(bool checked);