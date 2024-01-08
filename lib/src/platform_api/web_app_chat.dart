import 'package:js/js.dart';

@JS()
@staticInterop
class WebAppChat {}

extension WebAppChatX on WebAppChat {
  external int get id;
  external String get type;
  external String get title;
  external String? get username;
  @JS('photo_url')
  external String? get photoUrl;
}
