/**
 * 图片
 */

import 'package:flutter/material.dart';

class EluiImgComponent extends StatefulWidget {
  final String src;
  final String placeholder;
  final double width;
  final double height;
  final fit;

  EluiImgComponent({
    this.src,
    this.placeholder,
    this.width,
    this.height,
    this.fit
  });

  @override
  _EluiImgComponentState createState() => _EluiImgComponentState();
}

class _EluiImgComponentState extends State<EluiImgComponent> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: widget.placeholder??'assets/images/usercenter/background.png',
      image: widget.src??'',
      width: widget.width??120,
      height: widget.height??120,
      fit: widget.fit??BoxFit.fitWidth,
      fadeInCurve: Cubic(1, 2, 1, 2)
    );
  }
}
