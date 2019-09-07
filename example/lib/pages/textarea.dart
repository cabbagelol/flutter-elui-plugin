import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class textareaPage extends StatefulWidget {
  @override
  _textareaPageState createState() => _textareaPageState();
}

class _textareaPageState extends State<textareaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '多行输入框'),
        body: ListView(
          children: <Widget>[
            EluiTextareaComponent(
              maxLength: 100,
            )
          ],
        ));
  }
}
