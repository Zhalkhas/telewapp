import 'package:flutter/foundation.dart';

@immutable
class BackButtonConfig {
  final bool isVisible;
  final VoidCallback? onPressed;

  const BackButtonConfig({
    required this.isVisible,
    this.onPressed,
  });
  const BackButtonConfig.empty()
      : isVisible = false,
        onPressed = null;

  BackButtonConfig copyWith({
    bool? isVisible,
    VoidCallback? onPressed,
  }) =>
      BackButtonConfig(
        isVisible: isVisible ?? this.isVisible,
        onPressed: onPressed ?? this.onPressed,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackButtonConfig &&
          isVisible == other.isVisible &&
          onPressed == other.onPressed;

  @override
  int get hashCode => Object.hashAll([
        isVisible,
        onPressed,
      ]);
}
