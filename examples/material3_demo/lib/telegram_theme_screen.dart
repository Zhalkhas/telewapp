import 'package:flutter/material.dart';
import 'package:material3_demo/color_palettes_screen.dart';
import 'package:telewapp/telewapp.dart';

class TelegramThemeScreen extends StatelessWidget {
  const TelegramThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: TelegramThemeView(colorScheme: TelegramTheme.of(context)),
        ),
      ),
    );
  }
}

class TelegramThemeView extends StatelessWidget {
  const TelegramThemeView({super.key, required this.colorScheme});

  final TelegramThemeData colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Telegram Theme',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            border: Border.all(
              color: colorScheme.buttonTextColor ?? colorScheme.headerColor,
              width: 1,
            ),
          ),
          child: ColorGroup(
            children: [
              ColorChip(
                label: 'headerColor',
                color: colorScheme.headerColor,
              ),
              ColorChip(
                label: 'backgroundColor',
                color: colorScheme.backgroundColor,
              ),
              if (colorScheme.textColor != null)
                ColorChip(
                  label: 'textColor',
                  color: colorScheme.textColor!,
                ),
              if (colorScheme.hintColor != null)
                ColorChip(
                  label: 'hintColor',
                  color: colorScheme.hintColor!,
                ),
              if (colorScheme.linkColor != null)
                ColorChip(
                  label: 'linkColor',
                  color: colorScheme.linkColor!,
                ),
              if (colorScheme.buttonColor != null)
                ColorChip(
                  label: 'buttonColor',
                  color: colorScheme.buttonColor!,
                ),
              if (colorScheme.buttonTextColor != null)
                ColorChip(
                  label: 'buttonTextColor',
                  color: colorScheme.buttonTextColor!,
                ),
              if (colorScheme.secondaryBackgroundColor != null)
                ColorChip(
                  label: 'secondaryBackgroundColor',
                  color: colorScheme.secondaryBackgroundColor!,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
