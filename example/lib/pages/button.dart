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
          buttonView(
            child: EluiButtonComponent(
              radius: true,
              child: Text("无"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
                disabled: true, type: ButtonType.primary, theme: EluiButtonTheme(backgroundColor: Colors.black), child: Text("禁用")),
          ),
          buttonView(
            child: EluiButtonComponent(
              type: ButtonType.succeed,
              child: Text("成功"),
            ),
          ),
          buttonView(
              child: EluiButtonComponent(
            type: ButtonType.warning,
            child: Text("警告"),
          )),
          buttonView(
            child: EluiButtonComponent(
              type: ButtonType.error,
              child: Text("错误"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              theme: EluiButtonTheme(backgroundColor: Colors.purpleAccent),
              child: Text("自定义", style: TextStyle(color: Colors.white)),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              radius: true,
              hollow: true,
              type: ButtonType.primary,
              theme: EluiButtonTheme(borderWidth: 1, borderRadius: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("空心"), Text("空心状态下可以定义边框宽度", style: TextStyle(fontSize: 10))],
              ),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              radius: true,
              type: ButtonType.primary,
              child: Text("圆角"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              size: ButtonSize.mini,
              type: ButtonType.primary,
              child: Text("小"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              size: ButtonSize.normal,
              type: ButtonType.primary,
              child: Text("中"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              size: ButtonSize.large,
              type: ButtonType.primary,
              child: Text("大"),
            ),
          ),
          buttonView(
            child: EluiButtonComponent(
              size: ButtonSize.large,
              theme: EluiButtonTheme(
                buttonPadding: EdgeInsets.symmetric(vertical: 50),
              ),
              type: ButtonType.primary,
              child: Text("自定义 更大"),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonView extends StatelessWidget {
  final Widget child;

  buttonView({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      child: child ?? Container(),
    );
  }
}
