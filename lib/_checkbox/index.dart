/**
 * 功能：checkbox 复选框
 * 描述：
 * By 向堂 2019/8/28
 */

import 'package:flutter/material.dart';

import '../_theme/index.dart';

class EluiCheckboxComponent extends StatefulWidget {
  final Function onChanged;

  final bool checked;

  final Widget child;

  final Color color;

  final bool disable;

  EluiCheckboxComponent({
    this.onChanged,
    this.child,
    this.checked = false,
    this.color,
    this.disable = false,
  });

  @override
  _EluiCheckboxComponentState createState() => _EluiCheckboxComponentState();
}

class _EluiCheckboxComponentState extends State<EluiCheckboxComponent> {
  bool _checkBoxSelected = false;

  _handleCheckBox(value) {
    setState(() {
      _checkBoxSelected = value;
    });
    if (widget.onChanged == null) {
      return;
    }
    widget.onChanged(_checkBoxSelected);
  }

  EluiTheme theme;

  @override
  void initState() {
    super.initState();
    _checkBoxSelected = widget.checked;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = EluiUi.getTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (widget.disable) {
            return;
          }
          _handleCheckBox(_checkBoxSelected != true);
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: _checkboxItem(
                checked: _checkBoxSelected,
                color: widget.color ?? theme.primaryColor,
              ),
            ),
            widget.child ?? Container(),
          ],
        ),
      ),
    );
  }
}

class _checkboxItem extends StatelessWidget {
  final bool checked;
  final Color color;

  _checkboxItem({
    this.checked = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Container(
        decoration: BoxDecoration(
          color: checked ? color : Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: checked
              ? Icon(
            Icons.check,
            size: 18.0,
            color: Colors.white,
          )
              : Icon(
            Icons.check,
            size: 18.0,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
