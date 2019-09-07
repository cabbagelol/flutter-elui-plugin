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
  List<Map<String, Color>> eluitip = [];
}


class EluiTipComponent extends StatefulWidget with Tip {
  final Widget child;
  final String title;
  final Widget right;

  EluiTipComponent({
    this.title,
    this.child,
    this.right,
    EluiTip type = EluiTip.none,
  }) {
    this.tipType = type;
  }

  @override
  _EluiTipComponentState createState() => _EluiTipComponentState();
}

class _EluiTipComponentState extends State<EluiTipComponent> {
  static var type;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EluiTheme theme = EluiUi.getTheme(context);
    widget.eluitip = [
      { // none
        "color": Colors.transparent,
        "borderColor": Colors.transparent,
        "textColor": Color(0xff000000)
      },
      { // suceed
        "color": theme.succeedColorDisabled,
        "borderColor": theme.succeedColor,
        "textColor": theme.succeedColor
      },
      { // warning
        "color": theme.warnColorDisabled,
        "borderColor": theme.warnColor,
        "textColor": theme.warnColor
      },
      { // error
        "color": theme.errorColorDisabled,
        "borderColor": theme.errorColor,
        "textColor": theme.errorColor
      },
    ];
    type = widget.eluitip[widget.tipType.index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: new BoxDecoration(
        border: new Border.all(color: type['borderColor'], width: 0.5), // 边色与边宽度
        color: type['color'],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: widget.child??Text(widget.title.toString(), style: TextStyle(
              color: type['textColor']
            ))
          ),
          widget.right??Container()
         ],
      ),
    );
  }
}