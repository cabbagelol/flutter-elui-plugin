import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class messagePage extends StatefulWidget {
  @override
  _messagePageState createState() => _messagePageState();
}

class _messagePageState extends State<messagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '全局消息'),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.none,
                child: Text("标准消息提示"),
                onTap: () {
                  EluiMessageComponent.show(context)(child: Text('内容', style: TextStyle(
                    color: Colors.black
                  )));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("自定义消息提示"),
                    Text("设置黑色背影颜色,居左中", style: TextStyle(
                      fontSize: 10
                    ))
                  ],
                ),
                onTap: () {
                  EluiMessageComponent.show(context)(color: Colors.black, align: Alignment.centerLeft, child: Text('内容'));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.succeed,
                child: Text("成功"),
                onTap: () {
                  EluiMessageComponent.success(context)(child: Text('成功'));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.warning,
                child: Text("警告"),
                onTap: () {
                  EluiMessageComponent.warning(context)(child: Text('警告'));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.error,
                child: Text("错误"),
                onTap: () {
                  EluiMessageComponent.error(context)(child: Text('错误'));
                },
              ),
            ),
          ],
        ));
  }
}
