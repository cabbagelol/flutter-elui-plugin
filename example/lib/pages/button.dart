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
            _buttonCard(
              child: EluiButtonComponent(
                radius: true,
                child: Text("无"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                  disabled: true,
                  type: ButtonType.primary,
                  theme: EluiButtonTheme(
                      backgroundColor: Colors.black
                  ),
                  child: Text("禁用")
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                type: ButtonType.succeed,
                child: Text("成功"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                type: ButtonType.warning,
                child: Text("警告"),
              )
            ),
            _buttonCard(
              child: EluiButtonComponent(
                type: ButtonType.error,
                child: Text("错误"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                theme: EluiButtonTheme(
                    backgroundColor: Colors.black
                ),
                child: Text("自定义", style: TextStyle(
                  color: Colors.white
                )),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                radius: true,
                hollow: true,
                type: ButtonType.primary,
                theme: EluiButtonTheme(
                  borderWidth: 1,
                  borderRadius: 10
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("空心"),
                    Text("空心状态下可以定义边框宽度", style: TextStyle(
                      fontSize: 10
                    ))
                  ],
                ),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                radius: true,
                type: ButtonType.primary,
                child: Text("圆角"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                size: ButtonSize.mini,
                type: ButtonType.primary,
                child: Text("小"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                size: ButtonSize.normal,
                type: ButtonType.primary,
                child: Text("中"),
              ),
            ),
            _buttonCard(
              child: EluiButtonComponent(
                size: ButtonSize.large,
                type: ButtonType.primary,
                child: Text("大"),
              ),
            ),
          ],
        )
    );
  }
}

class _buttonCard extends StatelessWidget {
  final Widget child;

  _buttonCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: child?? Container()
    );
  }
}

