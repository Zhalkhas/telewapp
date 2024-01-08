import 'package:flutter/material.dart';
import 'package:telewapp/platform_api.dart';
import 'package:telewapp/telewapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TeleWAppController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(controller: controller),
      builder: (context, child) => TelegramTheme(
        controller: controller,
        overrideTheme: true,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final TeleWAppController controller;

  const MyHomePage({
    super.key,
    required this.controller,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TelegramThemeData telegramTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    telegramTheme = TelegramTheme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return TelegramButtonsConfig(
      controller: widget.controller,
      mainButtonConfig: MainButtonConfig.fromTheme(
        telegramTheme,
        text: 'Increment',
        isVisible: true,
        onPressed: () => setState(() => _counter++),
      ),
      backButtonConfig: BackButtonConfig(
        isVisible: true,
        onPressed: () => widget.controller.close(),
      ),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => widget.controller.showScanQrPopup(
              ScanQrPopupParams(text: 'Scanning QR'),
              (qrCode) => true,
            ),
            foregroundColor: telegramTheme.buttonTextColor,
            backgroundColor: telegramTheme.buttonColor,
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text('Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text('$_counter', style: const TextStyle(fontSize: 40)),
              ],
            ),
          )),
    );
  }
}
