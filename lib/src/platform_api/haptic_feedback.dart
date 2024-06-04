import 'dart:js_interop';

extension type HapticFeedback(JSObject _) implements JSObject {
  external void impactOccurred(String style);
  external void notificationOccurred(String type);
  external void selectionChanged();
}
