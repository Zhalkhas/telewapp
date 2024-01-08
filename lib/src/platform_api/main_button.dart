import 'package:js/js.dart';

@JS()
@staticInterop
class MainButton {}

extension MainButtonX on MainButton {
  external String get text;
  external MainButton setText(String text);
  external String get color;
  external set color(String color);
  external String get textColor;
  external set textColor(String textColor);
  external bool get isVisible;
  external set isVisible(bool isVisible);
  external bool get isActive;
  external set isActive(bool isActive);
  external bool get isProgressVisible;

  external void onClick(void Function() callback);
  external void offClick(void Function() callback);
  external void show();
  external void hide();
  external void enable();
  external void disable();
  external void showProgress([bool? leaveActive]);
  external void hideProgress();
}
