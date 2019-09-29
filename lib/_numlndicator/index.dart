/**
 * 功能：数字指示器
 * 描述：控件
 * By 向堂 2019/8/29
 */

import 'package:flutter/material.dart';

import '../_input/index.dart';

class EluiNumlndicatorComponent extends StatefulWidget {
  final Map data;
  final value;
  final double min;
  final double max;
  final double superposition;
  final bool longtag;
  final bool disabled;
  final Widget left;
  final Widget right;
  final Function onChange;

  EluiNumlndicatorComponent({
    this.data,
    this.value = 0,
    this.min,
    this.max,
    this.superposition = 1,
    this.longtag,
    this.disabled = false,
    this.left,
    this.right,
    this.onChange,
  });

  @override
  _EluiNumlndicatorComponentState createState() =>
      _EluiNumlndicatorComponentState();
}

class _EluiNumlndicatorComponentState extends State<EluiNumlndicatorComponent> {
  static double value = 0.0;

  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500,);

  TextEditingController _contentController = new TextEditingController();

  FocusNode _contentFocusNode = FocusNode();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _EluiNumlndicatorComponentState () {
    WidgetsBinding.instance.addPostFrameCallback((Duration time) {
      _setValue(value.toDouble());
    });
  }

  void _update(String type_) {
    var S_ = widget.superposition.toDouble();
    var V_ = value.toDouble();
    if (widget.disabled) {
      return;
    }
    switch (type_) {
      case 'add':
        if (widget.max != null ? V_ < widget.max || widget.max == null : true) {
          value = ((V_ % 1 == 0 ? V_ : V_ * 1000) + (S_ % 1 == 0 ? S_ : S_ * 1000)) / (S_ % 1 == 0 ? 1 : 1000) ?? 1;
        }
        break;
      case 'reduce':
        print(widget.min != null);
        if (widget.min != null ? V_ > widget.min : true) {
          value = ((V_ % 1 == 0 ? V_ : V_ * 1000) - (S_ % 1 == 0 ? S_ : S_ * 1000)) / (S_ % 1 == 0 ? 1 : 1000) ?? 1;
        }
        break;
    }
    _setValue(value);
  }

  void _setValue(value_) {
    widget.onChange({
      "data": widget.data,
      "value": value_
    });
    setState(() {
      controller.text = value_.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
            child: widget.left ??
                Text(
                  '+',
                  style: _textStyle,
                ),
          ),
          onTap: () {
            _update('add');
            _contentFocusNode.unfocus();
          },
          onLongPressMoveUpdate: (l) {
            _update('add');
          },
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(top: 7 ,bottom: 7, left: 10, right: 10,),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(6.0),),
            child:
              Input(
                type: TextInputType.number,
                controller: controller,
                onChange: (res) {
                  _setValue(res["value"]);
                },
              )

//            TextField(
//              focusNode: _contentFocusNode,
//              keyboardType: TextInputType.number,
//              onChanged: (res) {
//                _setValue(double.parse(res));
//              },
//              style: TextStyle(fontSize: 15),
//              controller: TextEditingController.fromValue(
//                TextEditingValue(text: value.toString(),),),
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                fillColor: Colors.transparent,
//                filled: false,
//                hasFloatingPlaceholder: false,
//              ),
//            ),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
            child: widget.right ??
                Text(
                  '-',
                  style: _textStyle,
                ),
          ),
          onTap: () {
            _update('reduce');
            _contentFocusNode.unfocus();
          },
          onLongPressMoveUpdate: (l) {
            _update('reduce');
          },
        ),
      ],
    );
  }
}
