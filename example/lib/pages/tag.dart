import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';

class tagPage extends StatefulWidget {
  @override
  _tagPageState createState() => _tagPageState();
}

class _tagPageState extends State<tagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: 'tag'),
        body: ListView(
          children: <Widget>[
            EluiCellComponent(
              title: '标准',
              cont: EluiTagComponent(
                color: EluiTagColor.none,
                value: '标签',
              ),
            ),
            EluiCellComponent(
              title: '圆角',
              cont: EluiTagComponent(
                round: true,
                value: '标签',
              ),
            ),
            EluiCellComponent(
              title: '幽灵',
              cont: EluiTagComponent(
                round: true,
                plain: true,
                value: '标签',
              ),
            ),
            EluiCellComponent(
              title: '颜色',
              cont: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  EluiTagComponent(
                    round: true,
                    color: EluiTagColor.suceed,
                    value: '标签',
                  ),
                  EluiTagComponent(
                    round: true,
                    color: EluiTagColor.error,
                    value: '标签',
                  ),
                  EluiTagComponent(
                    round: true,
                    color: EluiTagColor.primary,
                    value: '标签',
                  ),
                  EluiTagComponent(
                    round: true,
                    color: EluiTagColor.warning,
                    value: '标签',
                  )
                ],
              ),
            ),
            EluiCellComponent(
              title: '大小',
              cont: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  EluiTagComponent(
                    round: true,
                    size: EluiTagSize.no3,
                    value: '3号',
                  ),
                  EluiTagComponent(
                    round: true,
                    size: EluiTagSize.no4,
                    value: '4号',
                  ),
                  EluiTagComponent(
                    round: true,
                    size: EluiTagSize.no5,
                    value: '5号',
                  ),
                  EluiTagComponent(
                    round: true,
                    size: EluiTagSize.no7,
                    value: '7号',
                  )
                ],
              ),
            ),
            EluiCellComponent(
              title: '自定义',
              label: '通过themeTagColor构建标签字体/边框/背景颜色',
              cont: EluiTagComponent(
                color: EluiTagColor.none,
                theme:
                EluiTagtheme(borderColor: Colors.blue,  backgroundColor: Colors.black, textColor: Colors.white),
                value: '自定义标签',
              ),
            ),
          ],
        ));
  }
}
