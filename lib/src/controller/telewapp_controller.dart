import 'dart:ui';

import 'package:telewapp/src/controller/telewapp_controller_impl.dart';
import 'package:telewapp/src/platform_api/popup_params.dart';
import 'package:telewapp/src/platform_api/telegram_web_app.dart';
import 'package:telewapp/telewapp.dart';

abstract interface class TeleWAppController {
  factory TeleWAppController([TelegramWebApp? telegramWebApp]) =>
      TeleWAppControllerImpl(telegramWebApp ?? telewapp);

  BackButtonConfig get backButtonConfig;
  set backButtonConfig(BackButtonConfig newConfig);

  MainButtonConfig get mainButtonConfig;
  set mainButtonConfig(MainButtonConfig newConfig);

  TelegramThemeData get theme;

  Color? get headerColor;
  set headerColor(Color? color);
  Color? get backgroundColor;
  set backgroundColor(Color? color);

  Stream<TelegramThemeData> get onThemeChanged;
  Stream<(double, bool)> get onViewportHeightChanged;
  Stream<void> get onMainButtonClicked;
  Stream<void> get onBackButtonClicked;
  Stream<void> get onSettingsButtonClicked;
  Stream<({String url, InvoiceStatus status})> get onInvoiceClosed;
  Stream<String?> get onPopupClosed;
  Stream<String> get onQrTextReceived;
  Stream<TelegramClipboardData> get onClipboardTextReceived;
  Stream<WritePermissionStatus> get onWriteAccessRequested;
  Stream<ContactRequestStatus> get onContactRequested;

  void enableClosingInformation();
  void disableClosingInformation();

  void sendData(String data);

  void openLink(String url, {bool? tryInstantView});
  void openTelegramLink(String url);
  Future<InvoiceStatus> openInvoice(String url);

  Future<String?> showPopup(PopupParams params);
  Future<void> showAlert(String message);
  Future<bool> showConfirm(String message);
  Future<String> showScanQrPopup(
    ScanQrPopupParams params,
    bool? Function(String qrCode) callback,
  );
  void closeScanQrPopup();

  Future<TelegramClipboardData> readTextFromClipboard();
  Future<bool> requestWriteAccess();
  Future<bool> requestContact();

  void ready();
  void expand();
  void close();
}
