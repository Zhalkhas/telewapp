import 'dart:async';
import 'dart:ui';

import 'package:js/js.dart';
import 'package:telewapp/src/platform_api/platform_api.dart';
import 'package:telewapp/telewapp.dart';

class TeleWAppControllerImpl implements TeleWAppController {
  final TelegramWebApp telegramWebApp;

  @override
  BackButtonConfig get backButtonConfig => BackButtonConfig(
      isVisible: telegramWebApp.backButton?.isVisible ?? false);

  @override
  set backButtonConfig(BackButtonConfig newConfig) {
    if (telegramWebApp.backButton?.isVisible != newConfig.isVisible) {
      newConfig.isVisible
          ? telegramWebApp.backButton?.hide()
          : telegramWebApp.backButton?.show();
    }
  }

  @override
  MainButtonConfig get mainButtonConfig => MainButtonConfig(
        text: telegramWebApp.mainButton?.text ?? 'CONTINUE',
        color: telegramWebApp.mainButton?.color.toColor() ??
            telegramWebApp.themeParams?.buttonColor.toColor() ??
            const Color(0x00FFFFFF),
        textColor: telegramWebApp.mainButton?.textColor.toColor() ??
            telegramWebApp.themeParams?.buttonTextColor.toColor() ??
            const Color(0x00FFFFFF),
        isVisible: telegramWebApp.mainButton?.isVisible ?? false,
        isActive: telegramWebApp.mainButton?.isActive ?? true,
        isProgressVisible:
            telegramWebApp.mainButton?.isProgressVisible ?? false,
      );

  @override
  set mainButtonConfig(MainButtonConfig newConfig) {
    final config = mainButtonConfig;
    if (config == newConfig) {
      return;
    }
    if (config.text != newConfig.text) {
      telegramWebApp.mainButton?.setText(newConfig.text);
    }
    if (config.color != newConfig.color) {
      telegramWebApp.mainButton?.color = newConfig.color.toTelegramColor();
    }
    if (config.textColor != newConfig.textColor) {
      telegramWebApp.mainButton?.textColor =
          newConfig.textColor.toTelegramColor();
    }
    if (config.isVisible != newConfig.isVisible) {
      newConfig.isVisible
          ? telegramWebApp.mainButton?.show()
          : telegramWebApp.mainButton?.hide();
    }
    if (config.isActive != newConfig.isActive) {
      newConfig.isActive
          ? telegramWebApp.mainButton?.enable()
          : telegramWebApp.mainButton?.disable();
    }
    if (config.isProgressVisible != newConfig.isProgressVisible) {
      newConfig.isProgressVisible
          ? telegramWebApp.mainButton?.showProgress()
          : telegramWebApp.mainButton?.hideProgress();
    }
  }

  @override
  Color? get backgroundColor => telegramWebApp.backgroundColor?.toColor();
  @override
  set backgroundColor(Color? color) =>
      telegramWebApp.backgroundColor = color?.toTelegramColor();
  @override
  Color? get headerColor => telegramWebApp.headerColor?.toColor();
  @override
  set headerColor(Color? color) =>
      telegramWebApp.headerColor = color?.toTelegramColor();

  @override
  TelegramThemeData get theme => TelegramThemeData(
        colorScheme: TelegramColorScheme.fromString(telegramWebApp.colorScheme),
        backgroundColor: telegramWebApp.backgroundColor?.toColor(),
        headerColor: telegramWebApp.headerColor?.toColor(),
        textColor: telegramWebApp.themeParams?.textColor.toColor(),
        hintColor: telegramWebApp.themeParams?.hintColor.toColor(),
        linkColor: telegramWebApp.themeParams?.linkColor.toColor(),
        buttonColor: telegramWebApp.themeParams?.buttonColor.toColor(),
        buttonTextColor: telegramWebApp.themeParams?.buttonTextColor.toColor(),
        secondaryBackgroundColor:
            telegramWebApp.themeParams?.secondaryBgColor.toColor(),
      );

  final _onThemeChangedController = StreamController<TelegramThemeData>();
  final _onViewportHeightChangedController =
      StreamController<(double, bool)>.broadcast();
  final _onMainButtonClickedController = StreamController<void>.broadcast();
  final _onBackButtonClickedController = StreamController<void>.broadcast();
  final _onSettingsButtonClickedController = StreamController<void>.broadcast();
  final _onInvoiceClosedController =
      StreamController<({InvoiceStatus status, String url})>.broadcast();
  final _onPopupClosedController = StreamController<String?>.broadcast();
  final _onQrTextReceivedController = StreamController<String>.broadcast();
  final _onClipboardTextReceivedController =
      StreamController<TelegramClipboardData>.broadcast();
  final _onWriteAccessRequestedController =
      StreamController<WritePermissionStatus>.broadcast();
  final _onContactRequestedController =
      StreamController<ContactRequestStatus>.broadcast();

  TeleWAppControllerImpl(this.telegramWebApp) {
    telegramWebApp.onEvent(
      '${WebAppEvent.themeChanged}',
      allowInterop(
        () => _onThemeChangedController.add(TelegramThemeData(
          colorScheme:
              TelegramColorScheme.fromString(telegramWebApp.colorScheme),
          backgroundColor: telegramWebApp.backgroundColor?.toColor(),
          headerColor: telegramWebApp.headerColor?.toColor(),
          textColor: telegramWebApp.themeParams?.textColor.toColor(),
          hintColor: telegramWebApp.themeParams?.hintColor.toColor(),
          linkColor: telegramWebApp.themeParams?.linkColor.toColor(),
          buttonColor: telegramWebApp.themeParams?.buttonColor.toColor(),
          buttonTextColor:
              telegramWebApp.themeParams?.buttonTextColor.toColor(),
          secondaryBackgroundColor:
              telegramWebApp.themeParams?.secondaryBgColor.toColor(),
        )),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.viewportChanged}',
      allowInterop(
        (OnViewportChangedData data) => _onViewportHeightChangedController.add(
          (telewapp.viewportHeight ?? 0, data.isStateStable),
        ),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.mainButtonClicked}',
      allowInterop(
        () => _onMainButtonClickedController.add(null),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.backButtonClicked}',
      allowInterop(
        () => _onBackButtonClickedController.add(null),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.settingsButtonClicked}',
      allowInterop(
        () => _onSettingsButtonClickedController.add(null),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.invoiceClosed}',
      allowInterop(
        (OnInvoiceClosedData event) => _onInvoiceClosedController.add(
          (
            status: InvoiceStatus.fromString(event.status),
            url: event.url,
          ),
        ),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.popupClosed}',
      allowInterop(
        (String? event) => _onPopupClosedController.add(event),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.qrTextReceived}',
      allowInterop(
        (OnQrTextReceivedData event) =>
            _onQrTextReceivedController.add(event.data),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.clipboardTextReceived}',
      allowInterop(
        (OnClipboardTextReceivedData event) =>
            _onClipboardTextReceivedController.add(
          TelegramClipboardData.fromString(event.data),
        ),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.writeAccessRequested}',
      allowInterop(
        (OnWriteAccessRequestedData event) =>
            _onWriteAccessRequestedController.add(
          WritePermissionStatus.fromString(event.status),
        ),
      ),
    );
    telegramWebApp.onEvent(
      '${WebAppEvent.contactRequested}',
      allowInterop(
        (OnContactRequestedData event) => _onContactRequestedController.add(
          ContactRequestStatus.fromString(event.status),
        ),
      ),
    );
  }

  @override
  Stream<TelegramThemeData> get onThemeChanged =>
      _onThemeChangedController.stream;
  @override
  Stream<void> get onBackButtonClicked => _onBackButtonClickedController.stream;
  @override
  Stream<TelegramClipboardData> get onClipboardTextReceived =>
      _onClipboardTextReceivedController.stream;
  @override
  Stream<ContactRequestStatus> get onContactRequested =>
      _onContactRequestedController.stream;
  @override
  Stream<({InvoiceStatus status, String url})> get onInvoiceClosed =>
      _onInvoiceClosedController.stream;
  @override
  Stream<void> get onMainButtonClicked => _onMainButtonClickedController.stream;
  @override
  Stream<String?> get onPopupClosed => _onPopupClosedController.stream;
  @override
  Stream<String> get onQrTextReceived => _onQrTextReceivedController.stream;
  @override
  Stream<void> get onSettingsButtonClicked =>
      _onSettingsButtonClickedController.stream;
  @override
  Stream<(double, bool)> get onViewportHeightChanged =>
      _onViewportHeightChangedController.stream;
  @override
  Stream<WritePermissionStatus> get onWriteAccessRequested =>
      _onWriteAccessRequestedController.stream;

  @override
  void disableClosingInformation() =>
      telegramWebApp.disableClosingConfirmation();
  @override
  void enableClosingInformation() => telegramWebApp.enableClosingConfirmation();

  @override
  Future<InvoiceStatus> openInvoice(String url) {
    final completer = Completer<InvoiceStatus>();
    telegramWebApp.openInvoice(
      url,
      (status) => completer.complete(InvoiceStatus.fromString(status)),
    );
    return completer.future;
  }

  @override
  void openLink(String url, {bool? tryInstantView}) => telegramWebApp.openLink(
        url,
        tryInstantView != null
            ? OpenLinkParams(tryInstantView: tryInstantView)
            : null,
      );
  @override
  void openTelegramLink(String url) => telegramWebApp.openTelegramLink(url);

  @override
  Future<TelegramClipboardData> readTextFromClipboard() {
    final completer = Completer<TelegramClipboardData>();
    telegramWebApp.readTextFromClipboard(
      (text) => completer.complete(TelegramClipboardData.fromString(text)),
    );
    return completer.future;
  }

  @override
  Future<bool> requestContact() {
    final completer = Completer<bool>();
    telegramWebApp.requestContact(completer.complete);
    return completer.future;
  }

  @override
  Future<bool> requestWriteAccess() {
    final completer = Completer<bool>();
    telegramWebApp.requestWriteAccess(completer.complete);
    return completer.future;
  }

  @override
  void sendData(String data) => telegramWebApp.sendData(data);

  @override
  Future<void> showAlert(String message) {
    final completer = Completer<void>();
    telegramWebApp.showAlert(message, completer.complete);
    return completer.future;
  }

  @override
  Future<bool> showConfirm(String message) {
    final completer = Completer<bool>();
    telegramWebApp.showConfirm(message, completer.complete);
    return completer.future;
  }

  @override
  Future<String?> showPopup(PopupParams params) {
    final completer = Completer<String?>();
    telegramWebApp.showPopup(
      params,
      completer.complete,
    );
    return completer.future;
  }

  @override
  Future<String> showScanQrPopup(
    ScanQrPopupParams params,
    bool? Function(String qrCode) callback,
  ) {
    final completer = Completer<String>();
    telegramWebApp.showScanQrPopup(
      params,
      allowInterop(
        (qrCode) {
          if (callback(qrCode) == true) {
            completer.complete(qrCode);
            return true;
          }
          return false;
        },
      ),
    );
    return completer.future;
  }

  @override
  void closeScanQrPopup() => telegramWebApp.closeScanQrPopup();

  @override
  void close() => telegramWebApp.close();
  @override
  void expand() => telegramWebApp.expand();
  @override
  void ready() => telegramWebApp.ready();
}
