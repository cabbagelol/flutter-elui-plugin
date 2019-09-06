/**
* head
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EluiHeadComponent extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  final String title;
  final bool centerTitle;
  BuildContext context;
  final List<Widget> actions;
  final TextStyle titleStyle;
  final Color backgroundColor;
  final String backImgName;
  final bool isBack;

  EluiHeadComponent({
    this.bottom,
    this.title,
    this.centerTitle: true,
    this.context,
    this.actions,
    this.titleStyle,
    this.backgroundColor,
    this.backImgName,
    this.isBack: true,
  });

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(this.bottom != null ? 91 : 45);
}

class _MyAppBarState extends State<EluiHeadComponent>  {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      title: new Text(
        widget.title ?? 'title',
        style: widget.titleStyle ?? new TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: widget.centerTitle,
      leading: widget.isBack ? FlatButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(widget.context);
        },
      ) : null,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      elevation: 0,
      bottom: new AppBarBottom(
        child: widget.bottom,
      ),
      actions: widget.actions,
    );
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  AppBarBottom({
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 1,
            color: Color(0xFFf2f2f2),
          ),
          child ??
              SizedBox(
                height: 0,
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.child != null ? 47 : 1);
}