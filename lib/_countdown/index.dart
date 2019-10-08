/**
 * 功能：倒计时
 * 描述：
 * By 向堂 2019/9/29
 */

import 'package:flutter/material.dart';
import 'dart:async';

class EluiCountdownComponent extends StatefulWidget {
  final value;

  final end;

  final String placeholder;

  final String yInterval;

  final String tInterval;

  final bool day;

  final bool month;

  final bool fullyear;

  final bool hours;

  final bool minutes;

  final bool seconds;

  final Function onSucceed;

  EluiCountdownComponent({
    this.value,
    @required this.end,
    this.placeholder = "",
    this.yInterval = "-",
    this.tInterval = ":",
    this.day = true,
    this.month = true,
    this.fullyear = true,
    this.hours = true,
    this.minutes = true,
    this.seconds = true,
    this.onSucceed,
  });

  @override
  _EluiCountdownComponentState createState() => _EluiCountdownComponentState();
}

class _EluiCountdownComponentState extends State<EluiCountdownComponent> {
  /// 时间结果
  Map times = new Map();

  /// 定时器
  Timer timer;

  /// 开始
  var starttime;

  /// 结束
  var endtime;

  var date;


  @override
  void initState() {
    super.initState();

    this._time(widget.value, widget.end);
    this._getValue(widget.value, widget.end);
  }

  /// 启动定时器
  void _getValue(value, end) {

    timer = new Timer.periodic(Duration(seconds: 1), (timer) {

      this._time(value, end);

      if (date <= 0) {
        timer.cancel();
        if (widget.onSucceed == null) {return;}
        widget.onSucceed();
      }
    });
  }

  /// 处理内部时间
  void _time (value, end) {
    var value_ = value == null ? DateTime.now() : value;

    if (value_ is String) {
      starttime = DateTime.parse(value_);
    } else if (value_ is DateTime) {
      starttime = value_;
    } else {
      print("value 非String或DateTime类型");
      timer.cancel();
    }

    if (end != null) {
      if (end is String) {
        print("end ${end}");
        endtime = DateTime.parse(end);
      } else if (end is DateTime) {
        endtime = end;
      } else {
        print("end 非String或DateTime类型");
        timer.cancel();
      }
      date = endtime.microsecondsSinceEpoch - starttime.microsecondsSinceEpoch;
    }

    setState(() {
      times = {
        "fullyear": date >= 0 ? (date / (1000) / (1000) / (60) / (60) / (24) / (360)).floor() : 0,
        "day": date >= 0 ? (date / (1000) / (1000) / (60) / (60) / (24) % (24)).floor() : 0,
        "hours": date >= 0 ? (date / (1000) / (1000) / (60) / (60) % (24)).floor() : 0,
        "minutes": date >= 0 ? (date / (1000) / (1000) / (60) % (60)).floor() : 0,
        "seconds": date >= 0 ? (date / (1000) / (1000) % (60)).floor() : 0,
      };
    });
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Offstage(
          offstage: !widget.fullyear || times["fullyear"] <= 0,
          child: Text("${times["fullyear"]}年"),
        ),
        Offstage(
          offstage: !widget.day || times["day"] <= 0,
          child: Text("${times["day"]}天"),
        ),
        Offstage(
          offstage: !widget.hours || times["hours"] <= 0,
          child: Text("${times["hours"]}小时"),
        ),
        Offstage(
          offstage: !widget.minutes || times["minutes"] <= 0,
          child: Text("${times["minutes"]}分"),
        ),
        Offstage(
          offstage: !widget.seconds || times["seconds"] <= 0,
          child: Text("${times["seconds"]}秒"),
        ),

        /// placeholder
        Offstage(
          offstage: date > 0,
          child: Text(widget.placeholder),
        ),

      ],
    );
  }
}
