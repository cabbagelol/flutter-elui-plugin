/**
 * 图片
 */

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

typedef _Asset = Function({String src});

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

  static Widget Images({String src}) {
    return Container(
      height: 200,
      width: 200,
      child: CachedNetworkImage(
        imageUrl: src??"http://via.placeholder.com/200x150",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  @override
  _EluiImgComponentState createState() => _EluiImgComponentState();
}

class _EluiImgComponentState extends State<EluiImgComponent> {
  @override
  Widget build(BuildContext context) {
    return null;
//    FadeInImage.assetNetwork(
//        placeholder: widget.placeholder??'background.png',
//        image: widget.src??'',
//        width: widget.width??120,
//        height: widget.height??120,
//        fit: widget.fit??BoxFit.fitWidth,
//        fadeInCurve: Cubic(1, 2, 1, 2)
//    );
  }
}
