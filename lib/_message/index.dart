import 'package:flutter/material.dart';
import 'package:flutter_plugin_elui/_message/message.dart';
import 'package:flutter_plugin_elui/_theme/index.dart';
import '../utils.dart';

typedef _Notify = Function ({
  int duration,
  @required Widget child
});

typedef _Show = Function ({
  Color color,
  int duration,
  @required Widget child
});

class EluiMessageComponent extends ScaffoldState {
  // 成功
  static _Notify success (BuildContext context) {
    final int notifySuccessDuration = EluiUi.getConfig(context).notifySuccessDuration;
    return ({ duration, child }) {
      EluiMessageComponent.show(context)(
        color: EluiUi.getTheme(context).primaryColor,
        duration: duration == null ? notifySuccessDuration : duration,
        child: child
      );
    };
  }

  // 失败
  static error (BuildContext context) {
    final int notifyErrorDuration = EluiUi.getConfig(context).notifyErrorDuration;
    return ({ duration, child }) {
      EluiMessageComponent.show(context)(
        color: EluiUi.getTheme(context).errorColor,
        duration: duration == null ? notifyErrorDuration : duration,
        child: child
      );
    };
  }

  // 警告
  static warning (BuildContext context) {
    final int notifyErrorDuration = EluiUi.getConfig(context).notifyErrorDuration;
    return ({ duration, child }) {
      EluiMessageComponent.show(context)(
          color: EluiUi.getTheme(context).warnColor,
          duration: duration == null ? notifyErrorDuration : duration,
          child: child
      );
    };
  }

  static _Show show (BuildContext context) {
    final int notifyDuration = EluiUi.getConfig(context).notifyDuration;
    return ({ color, duration, child }) {
      final GlobalKey widgetKey = GlobalKey();
      final Function remove = createOverlayEntry(
        context: context,
        child: EluiMessageComponentWidget(
          key: widgetKey,
          color: color == null ? EluiUi.getTheme(context).warnColor : color,
          child: child
        )
      );

      void close() async {
        // 反向执行动画
        await (widgetKey.currentState as EluiMessageComponentWidgetState).reverseAnimation();
        remove();
      }

      Future.delayed(Duration(milliseconds: duration == null ? notifyDuration : duration), close);
    };
  }
}