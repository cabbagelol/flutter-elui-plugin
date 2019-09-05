import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/elui.dart';
import 'package:flutter_plugin_elui_example/router.dart';

class indexPage extends StatefulWidget {
  @override
  _indexPageState createState() => _indexPageState();
}

class _indexPageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiHeadComponent(context: context, title: '首页', isBack: false,),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Elui', style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue
                  )),
                  Text('Flutter UI库', style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue
                  ))
                ],
              ),
            ),
            EluiCellComponent(
              title: 'head',
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return headPage();
                }));
              },
            ),
            EluiCellComponent(
              title: 'cell',
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return cellPage();
                }));
              },
            ),
            EluiCellComponent(
              title: 'tag',
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return tagPage();
                }));
              },
            ),
            EluiCellComponent(
              title: 'head',
              islink: true,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return headPage();
                }));
              },
            )
          ],
        ));
  }
}
