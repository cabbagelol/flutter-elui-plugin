import 'package:flutter/material.dart';
import 'package:flutter_plugin_elui/_theme/index.dart';

class EluiTagComponent extends StatefulWidget {
  final child;
  final Color color;
  final TextStyle textStyle;
  final Border border;
  final bool hollow;

  EluiTagComponent({
    this.child,
    this.color,
    this.textStyle,
    this.border,
    this.hollow = false
  });

  @override
  EluiTagComponentState createState() => EluiTagComponentState();
}

class EluiTagComponentState extends State<EluiTagComponent> {
  Color color;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EluiTheme theme = EluiUi.getTheme(context);
    color = widget.color == null ? theme.warnColor : widget.color;
  }

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color boxColor;
    Border border;

    if (widget.hollow) {
      textColor = color;
      boxColor = Colors.transparent;
      border = Border.all(width: 1, color: color);
    } else {
      textColor = Colors.white;
      boxColor = color;
      border = null;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            border: widget.border == null ? border : widget.border
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 8, right: 10, bottom: 8, left: 10),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 13.0,
                color: textColor
              ),
              child: Text(widget.child, style: widget.textStyle)
            )
          )
        )
      ]
    );
  }
}
