import 'package:telewapp/src/models/telegram_color_scheme.dart';
import 'package:flutter/material.dart';

@immutable
class TelegramThemeData extends ThemeExtension<TelegramThemeData> {
  final TelegramColorScheme colorScheme;
  final Color? backgroundColor;
  final Color? headerColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? linkColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? secondaryBackgroundColor;

  const TelegramThemeData({
    required this.colorScheme,
    required this.backgroundColor,
    required this.headerColor,
    this.textColor,
    this.hintColor,
    this.linkColor,
    this.buttonColor,
    this.buttonTextColor,
    this.secondaryBackgroundColor,
  });

  ThemeData toMaterialTheme([ThemeData? initialTheme]) {
    final seed = buttonColor ?? headerColor;
    return ThemeData.from(
      colorScheme: seed == null
          ? switch (colorScheme) {
              TelegramColorScheme.light => const ColorScheme.light(),
              TelegramColorScheme.dark => const ColorScheme.dark(),
            }
          : ColorScheme.fromSeed(
              seedColor: seed,
              brightness: switch (colorScheme) {
                TelegramColorScheme.light => Brightness.light,
                TelegramColorScheme.dark => Brightness.dark,
              },
              background: backgroundColor,
              primaryContainer: secondaryBackgroundColor,
              onTertiary: hintColor,
            ),
      textTheme: (initialTheme?.textTheme ?? const TextTheme()).apply(
        bodyColor: textColor,
        displayColor: textColor,
        decorationColor: textColor,
      ),
    ).copyWith(
      extensions: [
        ...?initialTheme?.extensions.values,
        this,
      ],
    );
  }

  @override
  ThemeExtension<TelegramThemeData> copyWith({
    TelegramColorScheme? colorScheme,
    Color? backgroundColor,
    Color? headerColor,
    Color? textColor,
    Color? hintColor,
    Color? linkColor,
    Color? buttonColor,
    Color? buttonTextColor,
    Color? secondaryBackgroundColor,
  }) =>
      TelegramThemeData(
        colorScheme: colorScheme ?? this.colorScheme,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        headerColor: headerColor ?? this.headerColor,
        textColor: textColor ?? this.textColor,
        hintColor: hintColor ?? this.hintColor,
        linkColor: linkColor ?? this.linkColor,
        buttonColor: buttonColor ?? this.buttonColor,
        buttonTextColor: buttonTextColor ?? this.buttonTextColor,
        secondaryBackgroundColor:
            secondaryBackgroundColor ?? this.secondaryBackgroundColor,
      );

  @override
  ThemeExtension<TelegramThemeData> lerp(
    TelegramThemeData? other,
    double t,
  ) =>
      throw UnimplementedError();
}
