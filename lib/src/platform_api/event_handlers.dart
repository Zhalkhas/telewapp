import 'package:js/js.dart';

@JS()
@anonymous
@staticInterop
class OnViewportChangedData {}

extension OnViewportChangedDataX on OnViewportChangedData {
  external bool get isStateStable;
}

@JS()
@anonymous
@staticInterop
class OnInvoiceClosedData {}

extension OnInvoiceClosedDataX on OnInvoiceClosedData {
  external String get url;
  external String get status;
}

@JS()
@anonymous
@staticInterop
class OnQrTextReceivedData {}

extension OnQrTextReceivedDataX on OnQrTextReceivedData {
  external String get data;
}

@JS()
@anonymous
@staticInterop
class OnClipboardTextReceivedData {}

extension OnClipboardTextReceivedDataX on OnClipboardTextReceivedData {
  external String? get data;
}

@JS()
@anonymous
@staticInterop
class OnWriteAccessRequestedData {}

extension OnWriteAccessRequestedDataX on OnWriteAccessRequestedData {
  external String get status;
}

@JS()
@anonymous
@staticInterop
class OnContactRequestedData {}

extension OnContactRequestedDataX on OnContactRequestedData {
  external String get status;
}
