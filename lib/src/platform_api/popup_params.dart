import 'package:js/js.dart';

@JS()
@anonymous
@staticInterop
class PopupParams {
  external factory PopupParams({
    String? title,
    String message,
    List<PopupButton>? buttons,
  });
}

extension PopupParamsX on PopupParams {
  external String? get title;
  external String get message;
  external List<PopupButton>? buttons;
}

@JS()
@anonymous
@staticInterop
class PopupButton {
  external factory PopupButton({
    String? id,
    String? text,
    String? type,
  });
}

extension PopupButtonX on PopupButton {
  external String? get id;
  external String? get text;
  external String? get type;
}

@JS()
@anonymous
@staticInterop
class ScanQrPopupParams {
  external factory ScanQrPopupParams({String? text});
}

extension ScanQrPopupParamsX on ScanQrPopupParams {
  external String? get text;
}
