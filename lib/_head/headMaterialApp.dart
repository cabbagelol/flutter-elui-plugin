/**
 * head
 */

import 'package:flutter/material.dart';

class EluiMaterialAppComponent extends StatefulWidget {
  final Widget home;
  final initialRoute;
  final onGenerateRoute;
  final routes;
  EluiMaterialAppComponent({
    this.home,
    this.initialRoute,
    this.onGenerateRoute,
    this.routes
  });
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<EluiMaterialAppComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.home??Container(),
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      routes: widget.routes,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

    );
  }
}