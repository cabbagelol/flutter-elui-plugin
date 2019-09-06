import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class buttonPage extends StatefulWidget {
  @override
  _buttonPageState createState() => _buttonPageState();
}

class _buttonPageState extends State<buttonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '按钮'),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.warning,
                theme: EluiButtonTheme(
                  backgroundColor: Colors.amber
                ),
                child: Text("确认"),
                onTap: () {
                  EluiMessageComponent.show(context)(
                      child: Text('内容')
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
