import 'package:js/js.dart';

@JS()
@staticInterop
class BackButton {}

extension BackButtonX on BackButton {
  external bool get isVisible;
  external void onClick(void Function() callback);
  external void offClick(void Function() callback);
  external void show();
  external void hide();
}
