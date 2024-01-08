import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:telewapp/src/models/back_button_config.dart';
import 'package:telewapp/src/models/main_button_config.dart';
import 'package:telewapp/src/controller/telewapp_controller.dart';

class TelegramButtonsConfig extends StatefulWidget {
  final TeleWAppController controller;
  final MainButtonConfig mainButtonConfig;
  final BackButtonConfig backButtonConfig;
  final Widget child;

  TelegramButtonsConfig({
    super.key,
    required this.controller,
    MainButtonConfig? mainButtonConfig,
    this.backButtonConfig = const BackButtonConfig.empty(),
    required this.child,
  }) : mainButtonConfig =
            mainButtonConfig ?? MainButtonConfig.fromTheme(controller.theme);

  @override
  State<TelegramButtonsConfig> createState() => _TelegramButtonsConfigState();
}

class _TelegramButtonsConfigState extends State<TelegramButtonsConfig> {
  late StreamSubscription<void> _onMainButtonClickedSubscription;
  late StreamSubscription<void> _onBackButtonClickedSubscription;

  @override
  void initState() {
    super.initState();
    _onMainButtonClickedSubscription =
        widget.controller.onMainButtonClicked.listen(
      (_) => widget.mainButtonConfig.onPressed?.call(),
    );
    _onBackButtonClickedSubscription =
        widget.controller.onBackButtonClicked.listen(
      (event) => widget.backButtonConfig.onPressed?.call(),
    );
    widget.controller.mainButtonConfig = widget.mainButtonConfig;
    widget.controller.backButtonConfig = widget.backButtonConfig;
  }

  @override
  void didUpdateWidget(TelegramButtonsConfig oldWidget) {
    if (oldWidget.mainButtonConfig != widget.mainButtonConfig) {
      widget.controller.mainButtonConfig = widget.mainButtonConfig;
      if (oldWidget.mainButtonConfig.onPressed !=
          widget.mainButtonConfig.onPressed) {
        _onMainButtonClickedSubscription.cancel();
        _onMainButtonClickedSubscription =
            widget.controller.onMainButtonClicked.listen(
          (_) => widget.mainButtonConfig.onPressed?.call(),
        );
      }
    }
    if (oldWidget.backButtonConfig != widget.backButtonConfig) {
      widget.controller.backButtonConfig = widget.backButtonConfig;
      if (oldWidget.backButtonConfig.onPressed !=
          widget.backButtonConfig.onPressed) {
        _onBackButtonClickedSubscription.cancel();
        _onBackButtonClickedSubscription =
            widget.controller.onBackButtonClicked.listen(
          (_) => widget.backButtonConfig.onPressed?.call(),
        );
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _onBackButtonClickedSubscription.cancel();
    _onMainButtonClickedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
