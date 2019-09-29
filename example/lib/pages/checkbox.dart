import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class checkboxPage extends StatefulWidget {
  @override
  _checkboxPageState createState() => _checkboxPageState();
}

class _checkboxPageState extends State<checkboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: EluiHeadComponent(context: context, title: '单选'),
      body: ListView(
        children: <Widget>[
          EluiCellComponent(
            title: "自定义",
            cont: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EluiCheckboxComponent(
                  child: Text("内容"),
                  checked: true,
                ),
                EluiCheckboxComponent(child: Text("内容"), checked: true, color: Colors.blue),
                EluiCheckboxComponent(child: Text("内容"), checked: true, color: Colors.amber),
                EluiCheckboxComponent(child: Text("内容"), checked: true, color: Colors.green),
              ],
            ),
          ),
          EluiCheckboxComponent(),
        ],
      ),
    );
  }
}
