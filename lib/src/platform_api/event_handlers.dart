import 'dart:js_interop';

extension type OnViewportChangedData(JSObject _) implements JSObject {
  external bool get isStateStable;
}

extension type OnInvoiceClosedData(JSObject _) implements JSObject {
  external String get url;
  external String get status;
}

extension type OnQrTextReceivedData(JSObject _) implements JSObject {
  external String get data;
}

extension type OnClipboardTextReceivedData(JSObject _) implements JSObject {
  external String? get data;
}

extension type OnWriteAccessRequestedData(JSObject _) implements JSObject {
  external String get status;
}

extension type OnContactRequestedData(JSObject _) implements JSObject {
  external String get status;
}
