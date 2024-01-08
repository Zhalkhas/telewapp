enum TelegramColorScheme {
  light('light'),
  dark('dark');

  final String value;

  const TelegramColorScheme(this.value);

  factory TelegramColorScheme.fromString(
    String colorScheme, {
    TelegramColorScheme Function()? orElse,
  }) =>
      switch (colorScheme.toLowerCase()) {
        'light' => TelegramColorScheme.light,
        'dark' => TelegramColorScheme.dark,
        _ => orElse?.call() ?? TelegramColorScheme.light,
      };
}
