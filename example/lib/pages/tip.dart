import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class tipPage extends StatefulWidget {
  @override
  _tipPageState createState() => _tipPageState();
}

class _tipPageState extends State<tipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '提示1'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: "成功",
              cont: EluiTipComponent(
                type: EluiTip.suceed,
                title: '233',
              ),
            ),
            EluiCellComponent(
              title: "警告",
              cont: EluiTipComponent(
                type: EluiTip.warning,
                title: '233',
              ),
            ),
            EluiCellComponent(
              title: "错误",
              cont: EluiTipComponent(
                type: EluiTip.error,
                title: '233',
              ),
            ),
            EluiCellComponent(
              title: "右侧",
              cont: EluiTipComponent(
                title: '233',
                right: Container(
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        )
    );
  }
}
