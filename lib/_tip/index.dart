/**
 * 功能：tip
 * 描述：
 * By 向堂 2019/9/3
 */

import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/_theme/index.dart';

enum EluiTip {
  none,
  suceed,
  warning,
  error,
}

class Tip {
  // tip大小类型
  EluiTip tipType;

  // tip大小
  Map<String, Color> type;

  // tip大小配置
  List<Map<String, Color>> eluitip = [
    { // none
      "color": Colors.transparent,
      "borderColor": Colors.transparent,
      "textColor": Colors.transparent
    },
    { // suceed
      "color": Color(0xffb3dde0),
      "borderColor": Color(0xfff2f2f2),
      "textColor": Color.fromRGBO(139, 195, 74, 0.2)
    },
    { // warning
      "color": Color(0xfff5edd2),
      "borderColor": Color(0xfff5edd2),
      "textColor": Color(0xffffc107)
    },
    { // error
      "color": Color(0xfff2f2f2),
      "borderColor": Color(0xfff2f2f2),
      "textColor": Color.fromRGBO(244, 67, 54, 0.2)
    },
  ];
}


class EluiTipComponent extends StatefulWidget with Tip {
  final Widget child;
  final Widget right;

  EluiTipComponent({
    this.child,
    this.right,
    EluiTip type = EluiTip.none,
  }) {
    this.type = eluitip[type.index];
    this.tipType = type;
  }

  @override
  _EluiTipComponentState createState() => _EluiTipComponentState();
}

class _EluiTipComponentState extends State<EluiTipComponent> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EluiTheme theme = EluiUi.getTheme(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: new BoxDecoration(
        border: new Border.all(color: widget.type['borderColor'], width: 0.5), // 边色与边宽度
        color: widget.type['color'],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: widget.child
          ),
          widget.right??Container()
         ],
      ),
    );
  }
}


// EluiTipTextComponent
class EluiTipTextComponent extends StatefulWidget with Tip {
  final title;

  EluiTipTextComponent({
    this.title,
    EluiTip type = EluiTip.none,
  }) {
    this.type = eluitip[type.index];
    this.tipType = type;
  }

  @override
  _EluiTipTextComponentState createState() => _EluiTipTextComponentState();
}

class _EluiTipTextComponentState extends State<EluiTipTextComponent>  {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          widget.title,
          style: TextStyle(
              color: widget.type['textColor']
          ),
        ),
      ],
    );
  }
}
