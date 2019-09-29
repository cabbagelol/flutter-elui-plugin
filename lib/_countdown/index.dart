/**
 * 功能：倒计时
 * 描述：
 * By 向堂 2019/9/29
 */

import 'package:flutter/material.dart';

class EluiCountdownComponent extends StatefulWidget {
  final String value;

  final String end;

  final String placeholder;

  final String yInterval;

  final String tInterval;

  final day;

  final month;

  final fullyear;

  final hours;

  final minutes;

  final seconds;

  final milliseconds;

  EluiCountdownComponent({
    this.value,
    this.end,
    this.placeholder,
    this.yInterval = "-",
    this.tInterval = ":",
    this.day = true,
    this.month = true,
    this.fullyear = true,
    this.hours = true,
    this.minutes = true,
    this.seconds = true,
    this.milliseconds = false
  });

  @override
  _EluiCountdownComponentState createState() => _EluiCountdownComponentState();
}

class _EluiCountdownComponentState extends State<EluiCountdownComponent> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Text("")
      ],
    );
  }
}

