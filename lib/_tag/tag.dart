/**
 * 功能：单选
 * 描述：
 * By 向堂 2019/9/5
 */

import 'package:flutter/material.dart';
//import 'package:flutter_plugin_elui/_theme/index.dart';

// size
enum EluiTagSize { no3, no4, no5, no7 }

// color
enum EluiTagColor { none, succeed, warning, error, primary }

class _EluiTagSizeClass {
  // tag大小类型
  EluiTagSize tagType;

  // tag大小
  Map<String, double> size;

  // 大小配置
  final List<Map<String, double>> tagSizeList = [
    { // 3
      "paddingTop": 2,
      "paddingRight": 5,
      "paddingLeft": 5,
      "paddingBottom": 2,
      "fontSize": 12
    },
    { // 4
      "paddingTop": 8,
      "paddingRight": 10,
      "paddingLeft": 10,
      "paddingBottom": 8,
      "fontSize": 12
    },
    { // 5
      "paddingTop": 10,
      "paddingRight": 14,
      "paddingLeft": 14,
      "paddingBottom": 10,
      "fontSize": 12
    },
    { // 7
      "paddingTop": 15,
      "paddingRight": 20,
      "paddingLeft": 20,
      "paddingBottom": 15,
      "fontSize": 12
    },
  ];
}

class _EluiTagColorClass {
  // tag颜色类型
  EluiTagColor tagColor;

  // tag颜色
  Map<String, Color> color;

  // 颜色配置
  List<Map<String, Color>> tagColorList = [
    {
      // none
      "color": Color(0xfff2f2f2),
      "textColor": Color(0xff1a1a1a),
      "borderColor": Color(0xfff2f2f2)
    },
    {
      // suceed
      "color": Color.fromRGBO(96, 138, 48, 0.2),
      "textColor": Color(0xff8bc34a),
      "borderColor": Color.fromRGBO(96, 138, 48, 0.2)
    },
    {
      // warning
      "color": Color(0xffffc107),
      "textColor": Color(0xffffffff),
      "borderColor": Color(0xffffc107)
    },
    {
      // error
      "color": Color.fromRGBO(226, 48, 35, 0.2),
      "textColor": Color(0xffffffff),
      "borderColor": Color(0xfff44336)
    },
    {
      // primary
      "color": Color.fromRGBO(24, 182, 193, 0.2),
      "textColor": Color(0xff18b6c1),
      "borderColor": Color.fromRGBO(24, 182, 193, 0.2)
    },
  ];
}

class EluiTagtheme<EluiTagColor> with _EluiTagColorClass {
  final Color borderColor; // 边框颜色
  final Color textColor; // 字体颜色
  final Color backgroundColor; // 背景颜色

  EluiTagtheme({Key key, this.borderColor = null, this.textColor = null, this.backgroundColor = null});
}

class EluiTagComponent extends StatefulWidget
    with _EluiTagSizeClass, _EluiTagColorClass {
  // theme
  final EluiTagtheme theme;

  // 圆角
  final bool round;

  // 值
  final String value;

  // 幽灵
  final bool plain;

  // 自定义字体颜色
  final TextStyle textStyle;

  EluiTagComponent({
    this.theme,
    this.round = false,
    this.value,
    this.plain = false,
    this.textStyle,
    EluiTagColor color = EluiTagColor.none,
    EluiTagSize size = EluiTagSize.no4,}) {
    this.size = tagSizeList[size.index];
    this.tagType = size;
    this.color = tagColorList[color.index];
    this.tagColor = color;
  }

  @override
  EluiTagComponentState createState() => EluiTagComponentState();
}

class EluiTagComponentState extends State<EluiTagComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      DecoratedBox(
        decoration: BoxDecoration(
            color: widget.plain ? Colors.transparent : (widget.theme != null ? widget.theme.backgroundColor : widget.color['color']),
            borderRadius: BorderRadius.all(Radius.circular(widget.round ? 100 : 2.0)),
            border: widget.plain ? Border.all(
                style: BorderStyle.solid, color: widget.theme != null ? widget.theme.borderColor ?? widget.color['textColor'] : widget.color['textColor']) : null
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: widget.size['paddingTop'],
              right: widget.size['paddingRight'],
              bottom: widget.size['paddingBottom'],
              left: widget.size['paddingLeft']),
          child: DefaultTextStyle(
            style:
            TextStyle(fontSize: 13.0, color: widget.color['color']),
            child: Text(widget.value,
              style: widget.textStyle ??
                  TextStyle(
                    color: widget.theme != null ? widget.theme.textColor ?? widget.color['textColor'] : widget.color['textColor'],
                    fontSize: 13,),),),),)
    ]);
  }
}
