import 'package:js/js.dart';

@JS()
@staticInterop
class HapticFeedback {}

extension HapticFeedbackX on HapticFeedback {
  external void impactOccurred(String style);
  external void notificationOccurred(String type);
  external void selectionChanged();
}
