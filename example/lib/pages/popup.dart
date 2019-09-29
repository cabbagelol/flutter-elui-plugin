import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

export '../widget/card.dart';

class popupPage extends StatefulWidget {
  @override
  _popupPageState createState() => _popupPageState();
}

class _popupPageState extends State<popupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '弹框'),
        body: ListView(
          children: <Widget>[
            Card(
              child: EluiButtonComponent(
                type: ButtonType.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('标准'),
                    Text('标准', style: TextStyle(
                        fontSize: 12,
                        color: Color(0xfff2f2f2)
                    ))
                  ],
                ),
                onTap: () {
                  EluiPopupComponent(context)(
                      child: Align(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Text('我是内容, 可以随意自定义'),
                        ),
                      )
                  );
                },
              ),
            ),
            Card(
              child: EluiButtonComponent(
                type: ButtonType.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('方向'),
                    Text('控制方向', style: TextStyle(
                        fontSize: 12,
                        color: Color(0xfff2f2f2)
                    ))
                  ],
                ),
                onTap: () {
                  EluiPopupComponent(context)(
                      placement: EluiPopupPlacement.bottom,
                      child: Align(
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Text('我是内容, 可以随意自定义'),
                        ),
                      )
                  );
                },
              ),
            ),
            Card(
              child: EluiButtonComponent(
                type: ButtonType.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('自定义'),
                    Text('自定义主题颜色', style: TextStyle(
                        fontSize: 12,
                        color: Color(0xfff2f2f2)
                    ))
                  ],
                ),
                onTap: () {
                  EluiPopupComponent(context)(
                      theme: EluiPopupTheme(
                          popupBackgroundColor: Colors.amber,
                          maskBackgroundColor: Color.fromRGBO(255, 255, 255, .1)
                      ),
                      placement: EluiPopupPlacement.bottom,
                      child: Align(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text('我是内容, 可以随意自定义'),
                          )
                      )
                  );
                },
              ),
            )
          ],
        )
    );
  }
}
