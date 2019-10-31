/**
 * 图片
 */

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_plugin_elui/elui.dart';

class EluiImgComponent extends StatefulWidget {
  final String src;

  final double width;

  final double height;

  final BoxFit fit;

  final Widget errorWidget;

  final bool isPlaceholder;

  final PlaceholderWidgetBuilder placeholder;

  EluiImgComponent({
    this.src,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.errorWidget = const Icon(
      Icons.error,
      size: 50,
      color: Color(0xffeeeeee),
    ),
    this.isPlaceholder = false,
    this.placeholder,
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
        imageUrl: widget.src ?? "http://via.placeholder.com/200x150",
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
        placeholder: (context, url) {
          return widget.isPlaceholder
              ? ELuiLoadComponent(
                  type: "line",
                  color: Color(0xffaaaaaa),
                  lineWidth: 2,
                  size: 20,
                )
              : (widget.placeholder != null ? widget.placeholder : null);
        },
        errorWidget: (context, url, error) {
          //
          return true ? widget.errorWidget : Image.asset(
            "lib/_img/background.png",
            package: "flutter_plugin_elui",
          );
        },
      ),
    );
  }
}
