enum WebAppEvent {
  themeChanged('themeChanged'),
  viewportChanged('viewportChanged'),
  mainButtonClicked('mainButtonClicked'),
  backButtonClicked('backButtonClicked'),
  settingsButtonClicked('settingsButtonClicked'),
  invoiceClosed('invoiceClosed'),
  popupClosed('popupClosed'),
  qrTextReceived('qrTextReceived'),
  clipboardTextReceived('clipboardTextReceived'),
  writeAccessRequested('writeAccessRequested'),
  contactRequested('contactRequested');

  final String value;

  const WebAppEvent(this.value);

  @override
  String toString() => value;
}
