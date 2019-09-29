import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class imgPage extends StatefulWidget {
  @override
  _imgPageState createState() => _imgPageState();
}

class _imgPageState extends State<imgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '图片'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: "默认",
              cont: EluiImgComponent(
                width: 100,
                height: 100,
                src: 'https://res.wx.qq.com/wxdoc/dist/assets/img/0.4cb08bb4.jpg',
              ),
            ),
            EluiCellComponent(
              title: "图片裁剪、缩放的模式",
              label: "设置fix",
              cont: EluiImgComponent(
                fit: BoxFit.contain,
                width: 100,
                height: 100,
                src: 'https://res.wx.qq.com/wxdoc/dist/assets/img/0.4cb08bb4.jpg',
              ),
            ),
            EluiCellComponent(
              title: "加载错误",
              label: "错误的资源地址时",
              cont: EluiImgComponent(
                fit: BoxFit.contain,
                width: 100,
                height: 100,
                src: '',
              ),
            ),
          ],
        )
    );
  }
}
