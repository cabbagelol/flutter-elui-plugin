/**
 * 单元格
 */

import 'package:flutter/material.dart';

class EluiCellTextAlign {
  static const CrossAxisAlignment left = CrossAxisAlignment.start;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment right = CrossAxisAlignment.end;
}

class EluiCellTheme {
  final Color titleColor;
  final Color labelColor;
  final Color linkColor;
  final Color backgroundColor;

  static ThemeData theme;

  EluiCellTheme({
    this.titleColor,
    this.labelColor,
    this.linkColor = Colors.black,
    this.backgroundColor = Colors.white,
  });
}

class EluiCellComponent extends StatefulWidget {
  final Widget icons;
  final String title;
  final String label;
  final EluiCellTheme theme;
  final bool islink;
  final bool isBotton;
  final Widget cont;
  final CrossAxisAlignment textAlign;
  final GestureTapCallback onTap;

  EluiCellComponent({
    this.icons,
    this.title,
    this.islink = false,
    this.isBotton = false,
    this.label,
    EluiCellTheme theme,
    this.cont,
    this.textAlign = EluiCellTextAlign.center,
    GestureTapCallback onTap,
  })  : onTap = onTap ?? null,
        theme = theme ?? EluiCellTheme();

  @override
  State<EluiCellComponent> createState() {
    return EluiCellComponentState();
  }
}

class EluiCellComponentState extends State<EluiCellComponent> {
  EluiCellTheme _theme;

  @override
  Widget build(BuildContext context) {
    _theme = widget.theme;

    return GestureDetector(
      child: Container(
        color: _theme.backgroundColor,
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: widget.textAlign,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (widget.icons != null)
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: widget.icons,
                  ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: widget.label != null ? 5 : 0),
                        child: Text(
                          widget.title,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: _theme.titleColor),
                        ),
                      ),
                      if (widget.label != null)
                        Text(
                          widget.label ?? '',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 11, color: _theme.labelColor),
                        ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: widget.islink ? 10 : 0),
                    child: widget.cont ?? Column(),
                  )
                ],
              ),
            ),
            EluiCellLink(
              islink: widget.islink,
            )..linkColor = _theme.linkColor,
          ],
        ),
      ),
      onTap: () => widget.onTap?.call(),
    );
  }
}

class EluiCellIcon extends StatelessWidget {
  final Widget child;
  final bool show;

  EluiCellIcon({
    @required this.child,
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: child,
    );
  }
}

class EluiCellLink extends StatelessWidget {
  final bool islink;
  Color _linkColor;

  EluiCellLink({
    this.islink,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: islink,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: _linkColor,
      ),
    );
  }

  set linkColor(Color value) => _linkColor = value;
}
