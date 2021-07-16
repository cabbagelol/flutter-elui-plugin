import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_plugin_elui/_theme/index.dart';
import '../_animation/rotating.dart';
import '../_icon/index.dart';

// 颜色类型
enum ButtonType { none, succeed, warning, error, primary }

// size
enum ButtonSize { mini, normal, large }

class _EluiButtonClass {
  // 按钮大小类型
  ButtonSize sizeType;

  // 按钮大小
  Map<String, double> size;

  // 大小配置
  final List<Map<String, double>> sizeConfig = [
    {'fontSize': 13.0, 'height': 40, 'iconSize': 14.0, 'borderSize': 0.4},
    {'fontSize': 18.0, 'height': 50, 'iconSize': 16.0, 'borderSize': 0.5},
    {'fontSize': 21.0, 'height': 60, 'iconSize': 18.0, 'borderSize': 0.6}
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
  final EdgeInsets buttonPadding;
  final TextStyle textStyle;

  EluiButtonTheme({
    Key key,
    this.backgroundColor = Colors.transparent,
    this.borderWidth = 2,
    this.borderRadius = 2,
    this.textStyle,
    this.buttonPadding = const EdgeInsets.all(5),
  });
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
        'borderColor': theme.primaryColor,
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

  @override
  Widget build(BuildContext context) {
    Widget _child;
    EluiButtonTheme _theme = widget.theme;
    dynamic size = widget.size;
    bool disabled = widget.loading || widget.disabled;
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(widget.theme != null ? widget.theme.borderRadius : widget.radius ? 100 : 4));

    switch (widget.child.runtimeType) {
      case String:
        _child = Text(widget.child.toString());
        break;
      default:
        _child = widget.child;
    }

    return Material(
      borderRadius: borderRadius,
      color: type['backgroundColor'],
      child: InkWell(
        onTap: () => !disabled ? widget.onTap?.call() : null,
        borderRadius: borderRadius,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: widget.size['height'],
          padding: _theme?.buttonPadding,
          decoration: BoxDecoration(
            color:
                disabled ? type['disabledBackgroundColor'] : widget.theme != null ? widget.theme.backgroundColor : type['backgroundColor'],
            borderRadius: borderRadius,
            border: widget.hollow || widget.theme == ButtonType.none
                ? Border.all(width: widget.theme != null ? widget.theme.borderWidth : size['borderSize'], color: type['borderColor'])
                : null,
          ),
          child: EluiButtonTextChild(
            theme: _theme,
            child: _child,
            size: widget.size,
            disabled: widget.loading || widget.disabled,
            loading: widget.loading,
            type: type,
            sizeType: widget.sizeType,
          ),
        ),
      ),
    );
  }
}

class EluiButtonTextChild extends StatelessWidget {
  final EluiButtonTheme theme;
  final dynamic child;
  final size;
  final type;
  final sizeType;
  final bool disabled;
  final loading;

  EluiButtonTextChild({
    this.theme,
    this.child,
    this.size,
    this.sizeType,
    this.type,
    this.disabled,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      DefaultTextStyle(
        style: TextStyle(fontSize: size['fontSize'], color: type['fontColor']),
        child: child,
      )
    ];

    if (loading) {
      final Widget icon = Padding(
        padding: EdgeInsets.only(right: 5),
        child: Rotating(
          Icon(WeIcons.loading, color: type['fontColor'], size: size['iconSize']),
        ),
      );
      children.insert(0, icon);
    }

    return Opacity(
      opacity: disabled ? 0.7 : 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: sizeType == ButtonSize.mini ? MainAxisSize.min : MainAxisSize.max,
        children: children,
      ),
    );
  }
}
