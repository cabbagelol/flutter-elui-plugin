import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class numlndicatorPage extends StatefulWidget {
  @override
  _numlndicatorPageState createState() => _numlndicatorPageState();
}

class _numlndicatorPageState extends State<numlndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '数字指示器'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: "标准",
              cont: Container(
                width: 200,
                child: EluiNumlndicatorComponent(
                  value: 5.0,
                ),
              )
            ),
            EluiCellComponent(
                title: "最小值",
                label: "设置最小值0",
                cont: Container(
                  width: 200,
                  child: EluiNumlndicatorComponent(
                    min: 0,
                  ),
                )
            ),
            EluiCellComponent(
                title: "最大值",
                label: "设置最大值10",
                cont: Container(
                  width: 200,
                  child: EluiNumlndicatorComponent(
                    max: 10
                  ),
                )
            ),
            EluiCellComponent(
                title: "最大值与最小值",
                label: "0 - 10",
                cont: Container(
                  width: 200,
                  child: EluiNumlndicatorComponent(
                      min: 0,
                      max: 10
                  ),
                )
            )
          ],
        )
    );
  }
}
