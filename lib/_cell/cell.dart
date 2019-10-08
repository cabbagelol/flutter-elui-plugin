/**
 * 单元格
 */

import 'package:flutter/material.dart';

class EluiCellTextAlign {
  static const CrossAxisAlignment left = CrossAxisAlignment.start;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment right = CrossAxisAlignment.end;
}

class EluiCellComponent extends StatefulWidget {
  final Widget icons;
  final String title;
  final String label;
  final bool islink;
  final bool isBotton;
  final Widget cont;
  final CrossAxisAlignment textAlign;
  final GestureTapCallback onTap;

  EluiCellComponent({this.icons,
    this.title,
    this.islink = false,
    this.isBotton = false,
    this.label,
    this.cont,
    this.textAlign = EluiCellTextAlign.center,
    this.onTap,
  });

  @override
  State<EluiCellComponent> createState() {
    return EluiCellComponentState();
  }
}

class EluiCellComponentState extends State<EluiCellComponent> {
  Widget _islink() {
    if (widget.islink) {
      return Icon(Icons.keyboard_arrow_right);
    }
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Color(0xf2f2f2f2),
        padding: EdgeInsets.only(bottom: 1),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: widget.textAlign,
            children: <Widget>[
              Row(
                children: <Widget>[
                  widget.icons != null
                      ? Container(
                    margin: EdgeInsets.only(right: 10),
                    child: widget.icons,
                  )
                      : Container(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(widget.title, style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),),
                        ),
                        widget.label != null
                            ? Text(
                          widget.label,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 11),
                        )
                            : Column()
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
                  )),
              _islink()
            ],
          ),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
