import 'package:flutter/material.dart';
import 'package:telewapp/src/models/telegram_theme.dart';
import 'package:telewapp/src/controller/telewapp_controller.dart';

class TelegramTheme extends StatefulWidget {
  final TeleWAppController controller;
  final bool overrideTheme;
  final Widget child;
  const TelegramTheme({
    super.key,
    required this.controller,
    this.overrideTheme = false,
    required this.child,
  });

  static TelegramThemeData of(BuildContext context, {bool listen = true}) {
    final TelegramThemeInherited? inh = listen
        ? context.dependOnInheritedWidgetOfExactType<TelegramThemeInherited>()
        : context.getInheritedWidgetOfExactType<TelegramThemeInherited>();
    if (inh == null) {
      throw FlutterError('Could not find TelegramThemeInherited in context');
    }
    return inh.themeData;
  }

  static TelegramThemeData? maybeThemeExtensionOf(BuildContext context) =>
      Theme.of(context).extension<TelegramThemeData>();

  @override
  State<TelegramTheme> createState() => _TelegramThemeState();
}

class _TelegramThemeState extends State<TelegramTheme> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: widget.controller.theme,
      stream: widget.controller.onThemeChanged,
      builder: (context, snapshot) => widget.overrideTheme
          ? Theme(
              data: snapshot.requireData.toMaterialTheme(Theme.of(context)),
              child: TelegramThemeInherited(
                themeData: snapshot.requireData,
                child: widget.child,
              ),
            )
          : TelegramThemeInherited(
              themeData: snapshot.requireData,
              child: widget.child,
            ),
    );
  }
}

class TelegramThemeInherited extends InheritedWidget {
  final TelegramThemeData themeData;

  const TelegramThemeInherited(
      {super.key, required this.themeData, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is TelegramThemeInherited
          ? oldWidget.themeData != themeData
          : true;
}
