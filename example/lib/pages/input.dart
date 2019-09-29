import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '输入框'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: "值",
              label: "设置初始值",
              cont: EluiInputComponent(
                  value: "内容", icon: Icon(Icons.warning), Internalstyle: true, onChange: (value_) {
                    print(value_);
              },),
            ),
            EluiCellComponent(
              title: "标准",
              label: "标准的输入框",
              cont: EluiInputComponent(
                  title: "姓名",
                  value: "",
                  placeholder: "请输入内容",
                  Internalstyle: true),
            ),
            EluiCellComponent(
              title: "限制",
              label: "限制输入10个字",
              cont: EluiInputComponent(
                  maxLenght: 10, placeholder: "请输入内容", Internalstyle: true),
            ),
            EluiCellComponent(
              title: "插槽",
              label: "右侧插槽",
              cont: EluiInputComponent(
                  title: "手机号码",
                  value: "",
                  type: TextInputType.text,
                  placeholder: "请输入内容",
                  right: Text('右侧内容'),
                  Internalstyle: true),
            ),
            EluiCellComponent(
                title: "摒弃控件样式",
                label: "Internalstyle属性",
                cont: EluiInputComponent(
                    value: "",
                    type: TextInputType.text,
                    placeholder: "请输入内容",
                    Internalstyle: true))
          ],
        ));
  }
}
