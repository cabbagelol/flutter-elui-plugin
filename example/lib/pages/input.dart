import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '输入框'),
        body: ListView(
          children: <Widget>[
            EluiInputComponent(
              value: "值",
              icon: Icon(Icons.warning),
            ),
            EluiInputComponent(
              title: "姓名",
              value: "",
              placeholder: "请输入内容",
            ),
            EluiInputComponent(
              title: "姓名",
              value: "",
              placeholder: "请输入内容",
            )
          ],
        )
    );
  }
}
