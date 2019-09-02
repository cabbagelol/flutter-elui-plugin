/**
 * 功能：Location load
 * 描述：
 * By 向堂 2019/8/27
 */

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

class Location extends StatelessWidget {
  final size;

  Location({
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size??30,
      height: size??30,
      child: FlareActor(
          "assets/animation/location.flr" ,
          animation: "state"
      ),
    );
  }
}

