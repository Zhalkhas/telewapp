@JS()
library telegram_web_app;

import 'package:js/js.dart';
import 'package:telewapp/src/platform_api/back_button.dart';
import 'package:telewapp/src/platform_api/haptic_feedback.dart';
import 'package:telewapp/src/platform_api/main_button.dart';
import 'package:telewapp/src/platform_api/popup_params.dart';
import 'package:telewapp/src/platform_api/theme_params.dart';

@JS()
@staticInterop
class TelegramWebApp {}

extension TelegramWebAppX on TelegramWebApp {
  external String? get initData;
  external String? get version;
  external String? get platform;
  external String? get colorScheme;
  external ThemeParams? get themeParams;
  external bool? get isExternal;
  external double? get viewportHeight;
  external double? get viewportStableHeight;
  external String? get headerColor;
  external String? get backgroundColor;
  external bool? get isClosingConfirmationEnabled;
  @JS('BackButton')
  external BackButton? get backButton;
  @JS('MainButton')
  external MainButton? get mainButton;
  @JS('HapticFeedback')
  external HapticFeedback get hapticFeedback;
  external bool isVersionAtLeast(String version);
  @JS('setHeaderColor')
  external set headerColor(String? color);
  @JS('setBackgroundColor')
  external set backgroundColor(String? color);
  external void enableClosingConfirmation();
  external void disableClosingConfirmation();
  external void onEvent(String eventType, Function eventHandler);
  external void offEvent(String eventType, Function eventHandler);
  external void sendData(String data);
  external void switchInlineQuery(
    String query, [
    List<dynamic> chooseChatTypes,
  ]);
  external void openLink(String url, [OpenLinkParams? params]);
  external void openTelegramLink(String url);
  external void openInvoice(
    String url, [
    void Function(String invoiceStatus)? callback,
  ]);
  external void showPopup(
    PopupParams params, [
    void Function(String? buttonId) callback,
  ]);
  external void showAlert(
    String message, [
    void Function() callback,
  ]);
  external void showConfirm(
    String message, [
    void Function(bool isOk) callback,
  ]);
  external void showScanQrPopup(
    ScanQrPopupParams params, [
    bool? Function(String qrCode) callback,
  ]);
  external void closeScanQrPopup();
  external void readTextFromClipboard([void Function(String text)? callback]);
  external void requestWriteAccess([void Function(bool hasAccess)? callback]);
  external void requestContact([void Function(bool hasContact)? callback]);
  external void ready();
  external void expand();
  external void close();
}

@JS()
@anonymous
class OpenLinkParams {
  @JS('try_instant_view')
  external bool? get tryInstantView;

  external factory OpenLinkParams({
    bool? tryInstantView,
  });
}
