/**
 * 事件控制器
 * by https://blog.csdn.net/qq_28478281/article/details/84064947
 */

import 'package:flutter/material.dart';

class PlatformTapWidget extends StatefulWidget {
  final double radius;
  final Function onTap;
  final Widget child;
  final double elevation;
  final Color backgroundColor;
  final Color splashColor;
  final Function onLongTap;

  const PlatformTapWidget({
    Key key,
    this.radius = 0.0,
    this.onTap,
    this.elevation,
    this.backgroundColor = Colors.white,
    this.splashColor,
    this.onLongTap,
    this.child,
  }) : super(key: key);

  @override
  _PlatformTapWidgetState createState() => _PlatformTapWidgetState();
}

class _PlatformTapWidgetState extends State<PlatformTapWidget> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    Color splashColor = widget.splashColor ?? Colors.grey.withOpacity(0.3);

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      Widget w;

      w = ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.onTap,
          onTapDown: (d) => setState(() => this.isDown = true),
          onTapUp: (d) => setState(() => this.isDown = false),
          onTapCancel: () => setState(() => this.isDown = false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeIn,
            color: isDown ? splashColor : widget.backgroundColor,
            child: widget.child,
          ),
        ),
      );

      return w;
    }

    Widget w = ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Material(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.backgroundColor,
        elevation: 0.0,
        child: InkWell(
          child: widget.child,
          onTap: widget.onTap,
          onLongPress: widget.onLongTap,
        ),
      ),
    );

    if (widget.splashColor != null) {
      return Theme(
        data: Theme.of(context).copyWith(splashColor: widget.splashColor),
        child: w,
      );
    }

    return w;
  }
}