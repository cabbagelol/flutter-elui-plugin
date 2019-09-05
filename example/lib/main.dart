import 'dart:io';
import 'package:flutter/material.dart';
import 'router.dart';

void main(){
//  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
////    print(flutterErrorDetails.toString());
//  };
//  FlutterError.onError = (FlutterErrorDetails details) {
//    reportErrorAndLog(details);
//  };
  runApp(MyApp());
}


void collectLog(String line){
  print('===================== 收集日志 S ========================');
  print(line.toString());
  print('===================== 收集日志 E ========================');
}

void reportErrorAndLog(FlutterErrorDetails details){
  print('===================== 上报错误和日志逻辑 S ========================');
  print(details.toString());
  print('===================== 上报错误和日志逻辑 E ========================');
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
  print('===================== 构建错误信息 S ========================');
  print(stack.toString());
  print('===================== 构建错误信息 E ========================');
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: indexPage(),
    );
  }
}
