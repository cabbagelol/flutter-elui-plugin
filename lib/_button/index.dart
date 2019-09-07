import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/_theme/index.dart';
import '../_animation/rotating.dart';
import '../_icon/index.dart';

// 颜色类型
enum ButtonType { none, succeed, warning, error, primary }

// size
enum ButtonSize { mini, normal,large }

class _EluiButtonClass {
  // 按钮大小类型
  ButtonSize sizeType;

  // 按钮大小
  Map<String, double> size;

  // 大小配置
  final List<Map<String, double>> sizeConfig = [
    {'fontSize': 13.0, 'height': 30.0, 'iconSize': 14.0, 'borderSize': 0.4},
    {'fontSize': 18.0, 'height': 45.0, 'iconSize': 16.0, 'borderSize': 0.5},
    {'fontSize': 21.0, 'height': 60.0, 'iconSize': 18.0, 'borderSize': 0.6}
  ];
}

class EluiButtonComponent extends StatefulWidget with _EluiButtonClass {
  // 内容
  dynamic child;

  // 禁用
  final bool disabled;

  // 点击回调
  final Function onTap;

  // loading
  final bool loading;

  // 空心
  final bool hollow;

  // button 类型
  final ButtonType type;

  // 主题
  final EluiButtonTheme theme;

  final bool radius;

  EluiButtonComponent({
    this.child,
    ButtonSize size = ButtonSize.normal,
    this.hollow = false,
    this.type = ButtonType.none,
    this.theme,
    this.radius = false,
    this.disabled = false,
    this.loading = false,
    this.onTap,
  }) {
    this.size = sizeConfig[size.index];
    this.sizeType = size;
  }

  @override
  _EluiButtonComponentState createState() => _EluiButtonComponentState();
}

class EluiButtonTheme {
  final Color backgroundColor;
  final double borderWidth;
  final double borderRadius;

  EluiButtonTheme({Key key, this.backgroundColor = null, this.borderWidth = 2, this.borderRadius = 2});
}

class _EluiButtonComponentState extends State<EluiButtonComponent> {
  // 主题
  List<Map<String, Color>> themeConfig;

  // 按钮主题
  Map<String, Color> type;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EluiTheme theme = EluiUi.getTheme(context);
    // 按钮主题 none, succeed, warning, error, primary
    themeConfig = [
      // none
      {
        'backgroundColor': Colors.transparent,
        'fontColor': Colors.black,
        'disabledBackgroundColor': Colors.transparent,
        'borderColor': Colors.transparent,
        'hollowColor': Colors.transparent
      },
      // succeed
      {
        'backgroundColor': theme.succeedColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.succeedColorDisabled,
        'borderColor': theme.succeedColorDisabled,
        'hollowColor': theme.succeedColor
      },
      // warning
      {
        'backgroundColor': theme.warnColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.warnColorDisabled,
        'borderColor': theme.primaryColor,
        'hollowColor': theme.warnColor
      },
      // error
      {
        'backgroundColor': theme.errorColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.errorColorDisabled,
        'borderColor': theme.warnColor,
        'hollowColor': theme.errorColor
      },
      // primary
      {
        'backgroundColor': theme.primaryColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.primaryColorDisabled,
        'borderColor': theme.warnColor,
        'hollowColor': theme.primaryColor
      }
    ];

    final themeConf = themeConfig[widget.type.index];
    // 判断是否空心
    if (widget.hollow) {
      this.type = {
        'backgroundColor': Colors.transparent,
        'fontColor': themeConf['hollowColor'],
        'disabledBackgroundColor': null,
        'borderColor': themeConf['hollowColor']
      };
    } else {
      this.type = themeConf;
    }
  }

  // 按钮点击
  onClick() {
    if (widget.onTap is Function) {
      widget.onTap();
    }
  }

  // 渲染按钮内容
  Widget renderChild(content) {
    // size
    final size = widget.size;
    // 是否禁用状态
    final bool disabled = widget.loading || widget.disabled;
    Widget child;
    if (content is String) {
      child = Text(content);
    } else {
      child = content;
    }

    // 内容
    List<Widget> children = [
      DefaultTextStyle(
          style:
              TextStyle(fontSize: size['fontSize'], color: type['fontColor']),
          child: child)
    ];

    if (widget.loading) {
      final Widget icon = Padding(
          padding: EdgeInsets.only(right: 5),
          child: Rotating(Icon(WeIcons.loading,
              color: type['fontColor'], size: size['iconSize'])));
      children.insert(0, icon);
    }

    return Opacity(
        opacity: disabled ? 0.7 : 1,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: widget.sizeType == ButtonSize.mini
                ? MainAxisSize.min
                : MainAxisSize.max,
            children: children));
  }

  @override
  Widget build(BuildContext context) {
    // size
    final size = widget.size;
    // 是否禁用状态
    final bool disabled = widget.loading || widget.disabled;
    // 圆角
    final BorderRadius borderRadius = BorderRadius.all(Radius.circular(widget.theme != null ? widget.theme.borderRadius : widget.radius ? 100 : 4));
    // 按钮
    final Widget button = Container(
        height: size['height'],
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: disabled ? type['disabledBackgroundColor'] : widget.theme != null ? widget.theme.backgroundColor : type['backgroundColor'],
            borderRadius: borderRadius,
            // 空心或者默认按钮才添加边框
            border: widget.hollow || widget.theme == ButtonType.none
                ? Border.all(
                    width: widget.theme != null ? widget.theme.borderWidth : size['borderSize'], color: type['borderColor'])
                : null),
        child: renderChild(widget.child));

    // 禁用状态
    if (disabled) {
      return button;
    }

    return Material(
        borderRadius: borderRadius,
        color: type['backgroundColor'],
        child:
            InkWell(onTap: onClick, borderRadius: borderRadius, child: button));
  }
}
