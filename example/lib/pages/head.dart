import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class headPage extends StatefulWidget {
  @override
  _headPageState createState() => _headPageState();
}

class _headPageState extends State<headPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: 'head'),
        body: ListView(
          children: <Widget>[
            Container(
              child: Text('233'),
            )
          ],
        )
    );
  }
}
