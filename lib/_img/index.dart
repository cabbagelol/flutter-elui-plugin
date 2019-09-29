/**
 * 图片
 */

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class EluiImgComponent extends StatefulWidget {
  final String src;
  final String placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget errorWidget;

  EluiImgComponent({
    this.src,
    this.placeholder,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.errorWidget = const Icon(Icons.error, size: 50, color: Color(0xffeeeeee),
    )
  });

  @override
  _EluiImgComponentState createState() => _EluiImgComponentState();
}

class _EluiImgComponentState extends State<EluiImgComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: CachedNetworkImage(
        imageUrl: widget.src??"http://via.placeholder.com/200x150",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: widget.fit,
//                colorFilter:
//                ColorFilter.mode(Colors.red, BlendMode.colorBurn)
            ),
          ),
        ),
//        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => widget.errorWidget,
      ),
    );
  }
}
