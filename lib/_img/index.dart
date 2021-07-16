/**
 * 图片
 */

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_plugin_elui/elui.dart';

class EluiImgTheme {
  final Color backgroundColor;

  EluiImgTheme({
    this.backgroundColor = Colors.white,
  });
}

class EluiImgComponent extends StatefulWidget {
  final String src;

  final EluiImgTheme theme;

  final double width;

  final double height;

  final BoxFit fit;

  final Widget errorWidget;

  final bool isPlaceholder;

  final PlaceholderWidgetBuilder placeholder;

  EluiImgComponent({
    @required this.src,
    EluiImgTheme theme,
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
  }) : theme = theme ?? EluiImgTheme();

  @override
  _EluiImgComponentState createState() => _EluiImgComponentState();
}

class _EluiImgComponentState extends State<EluiImgComponent> {
  @override
  Widget build(BuildContext context) {
    EluiImgTheme _theme = widget.theme;

    return CachedNetworkImage(
      color: _theme.backgroundColor,
      imageUrl: widget.src ?? "http://via.placeholder.com/200x150",
      width: widget.width,
      height: widget.height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: widget.fit,
          ),
        ),
      ),
      placeholder: widget.placeholder == null ? (BuildContext context, String url) {
        return ELuiLoadComponent(
          type: "line",
          color: Color(0xffaaaaaa),
          lineWidth: 2,
          size: 20,
        );
      } : widget.placeholder,
      errorWidget: (context, url, error) {
        return Image.asset(
          "lib/_img/background.png",
          package: "flutter_plugin_elui",
        );
      },
    );
  }
}
