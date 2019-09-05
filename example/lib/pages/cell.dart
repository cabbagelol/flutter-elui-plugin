import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class cellPage extends StatefulWidget {
  @override
  _cellPageState createState() => _cellPageState();
}

class _cellPageState extends State<cellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: 'cell'),
        body: ListView(
          children: <Widget>[
            Container(
              child: Text('cell'),
            )
          ],
        )
    );
  }
}
