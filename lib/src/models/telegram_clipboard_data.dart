import 'package:meta/meta.dart';

sealed class TelegramClipboardData {
  abstract final String? data;
  const TelegramClipboardData();

  const factory TelegramClipboardData.nonText() = TelegramClipboardDataNonText;
  const factory TelegramClipboardData.text(String data) =
      TelegramClipboardDataText;
  const factory TelegramClipboardData.noPermission() =
      TelegramClipboardDataNoPermission;

  factory TelegramClipboardData.fromString(String? data) => switch (data) {
        null => const TelegramClipboardData.noPermission(),
        '' => const TelegramClipboardData.nonText(),
        _ => TelegramClipboardData.text(data),
      };
}

@immutable
class TelegramClipboardDataNonText extends TelegramClipboardData {
  @override
  String get data => '';

  const TelegramClipboardDataNonText();
}

@immutable
class TelegramClipboardDataText extends TelegramClipboardData {
  @override
  final String data;

  const TelegramClipboardDataText(this.data);
}

@immutable
class TelegramClipboardDataNoPermission extends TelegramClipboardData {
  @override
  String? get data => null;

  const TelegramClipboardDataNoPermission();
}
