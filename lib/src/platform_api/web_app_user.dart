import 'package:js/js.dart';

@JS()
@staticInterop
class WebAppUser {}

extension WebAppUserX on WebAppUser {
  external int get id;
  @JS('is_bot')
  external bool? get isBot;
  @JS('first_name')
  external String get firstName;
  @JS('last_name')
  external String? get lastName;
  @JS('language_code')
  external String? get languageCode;
  @JS('is_premium')
  external bool get isPremium;
  @JS('added_to_attachment_menu')
  external bool? get addedToAttachmentMenu;
  @JS('allows_write_to_pm')
  external bool? get allowsWriteToPM;
  @JS('photo_url')
  external String? get photoUrl;
}
