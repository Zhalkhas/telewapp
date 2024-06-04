import 'package:js/js.dart';

@JS()
class ThemeParams {}

extension ThemeParamsX on ThemeParams {
  @JS('bg_color')
  external String get bgColor;
  @JS('text_color')
  external String get textColor;
  @JS('hint_color')
  external String get hintColor;
  @JS('link_color')
  external String get linkColor;
  @JS('button_color')
  external String get buttonColor;
  @JS('button_text_color')
  external String get buttonTextColor;
  @JS('secondary_bg_color')
  external String get secondaryBgColor;
}
