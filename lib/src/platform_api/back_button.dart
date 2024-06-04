import 'dart:js_interop';

extension type BackButton(JSObject _) implements JSObject {
  external bool get isVisible;
  external void onClick(JSExportedDartFunction callback);
  external void offClick(JSExportedDartFunction callback);
  external void show();
  external void hide();
}
