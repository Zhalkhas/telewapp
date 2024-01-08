import 'package:js/js.dart';
import 'package:telewapp/src/platform_api/telegram_web_app.dart';

@JS()
@staticInterop
class TwAppWindow {}

extension TwAppWindowX on TwAppWindow {
  @JS('Telegram')
  external Telegram get telegram;
}

@JS()
@staticInterop
class Telegram {}

extension TelegramX on Telegram {
  @JS('WebApp')
  external TelegramWebApp get webApp;
}
