import 'dart:js_interop';

extension type CloudStorage(JSObject _) implements JSObject{
  external void setItem(
    String key,
    String value, [
    void Function(Object? error, [bool? isStored])? callback,
  ]);
  external void getItem(
    String key,
    void Function(Object? error, [String? value]) callback,
  );
  external void getItems(
    List<String> key,
    void Function(Object? error, [List<String>? values]) callback,
  );
  external void removeItem(
    String key, [
    void Function(Object? error, [bool? isRemoved]) callback,
  ]);
  external void removeItems(
    List<String> key, [
    void Function(Object? error, [bool? isRemoved]) callback,
  ]);
  external void getKeys(
    void Function(Object? error, [List<String>? keys]) callback,
  );
}
