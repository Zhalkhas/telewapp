import 'dart:ui';

extension TelegramColor on String {
  Color toColor() {
    final <int>[r, g, b] = RegExp('..')
        .allMatches(substring(1))
        .map<String?>((e) => e.group(0))
        .map<int>((e) => e != null ? int.tryParse(e, radix: 16) ?? 0x00 : 0x00)
        .toList();
    return Color.fromARGB(255, r, g, b);
  }
}

extension ColorToTelegram on Color {
  String toTelegramColor() => '#${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
