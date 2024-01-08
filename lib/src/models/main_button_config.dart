import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:telewapp/src/models/telegram_theme.dart';

@immutable
class MainButtonConfig {
  final String text;
  final Color color;
  final Color textColor;
  final bool isVisible;
  final bool isActive;
  final bool isProgressVisible;
  final VoidCallback? onPressed;

  MainButtonConfig.fromTheme(
    TelegramThemeData theme, {
    String? text,
    Color? color,
    Color? textColor,
    bool? isVisible,
    bool? isActive,
    bool? isProgressVisible,
    this.onPressed,
  })  : text = text ?? 'CONTINUE',
        color = color ?? theme.buttonColor ?? const Color(0x00ffffff),
        textColor =
            textColor ?? theme.buttonTextColor ?? const Color(0x00ffffff),
        isVisible = isVisible ?? false,
        isActive = isActive ?? true,
        isProgressVisible = isProgressVisible ?? false;

  const MainButtonConfig({
    required this.text,
    required this.color,
    required this.textColor,
    required this.isVisible,
    required this.isActive,
    required this.isProgressVisible,
    this.onPressed,
  });

  MainButtonConfig copyWith({
    String? text,
    Color? color,
    Color? textColor,
    bool? isVisible,
    bool? isActive,
    bool? isProgressVisible,
    VoidCallback? onPressed,
  }) =>
      MainButtonConfig(
        text: text ?? this.text,
        color: color ?? this.color,
        textColor: textColor ?? this.textColor,
        isVisible: isVisible ?? this.isVisible,
        isActive: isActive ?? this.isActive,
        isProgressVisible: isProgressVisible ?? this.isProgressVisible,
        onPressed: onPressed ?? this.onPressed,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainButtonConfig &&
          text == other.text &&
          color == other.color &&
          textColor == other.textColor &&
          isVisible == other.isVisible &&
          isActive == other.isActive &&
          isProgressVisible == other.isProgressVisible &&
          onPressed == other.onPressed;

  @override
  int get hashCode => Object.hashAll(
        [
          text,
          color,
          textColor,
          isVisible,
          isActive,
          isProgressVisible,
          onPressed,
        ],
      );

  @override
  String toString() {
    return 'MainButtonConfig(text: $text,\n'
        'color: $color,\n'
        'textColor: $textColor,\n'
        'isVisible: $isVisible,\n'
        'isActive: $isActive,\n'
        'isProgressVisible: $isProgressVisible,\n'
        'onPressed: $onPressed)';
  }
}
