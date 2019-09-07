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
            EluiImgComponent.Images(
              src: '',
            ),
          ],
        )
    );
  }
}
