// ignore_for_file: duplicate_export

library telewapp;

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

import 'package:telewapp/src/platform_api/twapp_window.dart';

export 'src/controller/telewapp_controller.dart';
export 'src/models/back_button_config.dart';
export 'src/models/contact_request_status.dart';
export 'src/models/invoice_status.dart';
export 'src/models/main_button_config.dart';
export 'src/models/telegram_clipboard_data.dart';
export 'src/models/telegram_color_scheme.dart';
export 'src/models/telegram_color.dart';
export 'src/models/telegram_theme.dart';
export 'src/models/theme_update.dart';
export 'src/models/web_app_event.dart';
export 'src/models/write_permission_status.dart';
export 'src/widgets/telegram_buttons_config.dart';
export 'src/widgets/telegram_theme.dart';

final telewapp = () {
  try {
    return (window as TwAppWindow).telegram.webApp;
  } on TypeError catch (e, st) {
    Error.throwWithStackTrace(
      Exception(
        'Could not find window.Telegram.WebApp. '
        'Did you forget to add <script> tag to index.html?',
      ),
      st,
    );
  }
}();
