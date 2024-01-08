import 'package:js/js.dart';
import 'package:telewapp/src/platform_api/web_app_chat.dart';
import 'package:telewapp/src/platform_api/web_app_user.dart';

@JS()
@staticInterop
class WebAppInitData {}

extension WebAppInitDataX on WebAppInitData {
  @JS('query_id')
  external String? get queryId;
  external WebAppUser? get user;
  external WebAppUser? get receiver;
  external WebAppChat? get chat;
  @JS('chat_type')
  external String? get chatType;
  @JS('chat_instance')
  external String? get chatInstance;
  @JS('start_param')
  external String? get startParam;
  @JS('can_send_after')
  external int? get canSendAfter;
  @JS('auth_date')
  external int get authDate;
  external String get hash;
}
