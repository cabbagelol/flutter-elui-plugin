import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class countdownPage extends StatefulWidget {
  @override
  _countdownPageState createState() => _countdownPageState();
}

class _countdownPageState extends State<countdownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: EluiHeadComponent(context: context, title: "定时器"),
      body: ListView(
        children: <Widget>[
          EluiCellComponent(
            title: "倒计时",
            label: "设置结束时间",
            cont: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EluiCountdownComponent(
                  end: "2030-07-20",
                )
              ],
            ),
          ),

          EluiCellComponent(
            title: "自定义当前时间",
            label: "从2090-01-01 00:00:00到2089-01-01 00:00:00，分别水年日时分秒",
            cont: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EluiCountdownComponent(
                  end: "2090-01-01 00:00:00",
                  value: "2089-12-02 00:00:00",
                  day : true,
                  month : false,
                  fullyear : false,
                  hours : false,
                  minutes : false,
                  seconds : false,
                )
              ],
            ),
          ),

          EluiCellComponent(
            title: "过期",
            label: "当时间过期时会触发成功时间，并显示placeholder内容",
            cont: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                EluiCountdownComponent(
                  end: "2000-01-01",
                  placeholder: "活动已经结束啦",
                )
              ],
            ),
          ),
        ],
      ),
    );  }
}
