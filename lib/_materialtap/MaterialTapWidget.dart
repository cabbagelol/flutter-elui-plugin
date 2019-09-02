/**
 * 事件控制器
 * by https://blog.csdn.net/qq_28478281/article/details/84064947
 */

import 'package:flutter/material.dart';

class MaterialTapWidget extends StatelessWidget {
  final double radius;
  final Function onTap;
  final Widget child;
  final double elevation;
  final Color backgroundColor;
  final Color splashColor;
  final Function onLongTap;
  final Function onDoubleTap;  //添加字段

  const MaterialTapWidget({
    Key key,
    this.radius = 0.0,
    this.onTap,
    this.onLongTap,
    @required this.child,
    this.splashColor,
    this.elevation = 0.0,
    this.backgroundColor = Colors.transparent,
    this.onDoubleTap, //添加构造方法
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget w = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        elevation: 0.0,
        child: InkWell(
          child: child,
          onTap: onTap,
          onDoubleTap: onDoubleTap, //添加控件回调
          onLongPress: onLongTap,
        ),
      ),
    );

    if (this.splashColor != null) {
      return Theme(
        data: Theme.of(context).copyWith(splashColor: this.splashColor),
        child: w,
      );
    }

    return w;
  }
}