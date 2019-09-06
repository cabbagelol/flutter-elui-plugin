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
        appBar: EluiHeadComponent(context: context, title: '单元格'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: '普通',
            ),
            EluiCellComponent(
              title: '普通',
              label: '带label属性',
            ),
            EluiCellComponent(
              icons: Icon(Icons.warning, size: 30, color: Color(0xffe343e3)),
              title: '普通',
              label: '设Icon插槽',
            ),
            EluiCellComponent(
              icons: Icon(Icons.library_music),
              title: '普通',
              label: '设置箭头',
              islink: true,
            ),
            EluiCellComponent(
              icons: Icon(Icons.supervised_user_circle),
              title: '普通',
              label: '设置cont插槽内容',
              cont: Container(
                child: Text('自定义内容'),
              ),
            )
          ],
        )
    );
  }
}
