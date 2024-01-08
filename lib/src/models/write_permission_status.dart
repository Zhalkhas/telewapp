enum WritePermissionStatus {
  allowed('allowed'),
  cancelled('cancelled');

  final String value;

  const WritePermissionStatus(this.value);

  factory WritePermissionStatus.fromString(
    String status, {
    WritePermissionStatus Function()? orElse,
  }) =>
      WritePermissionStatus.values.firstWhere(
        (e) => '$e' == status,
        orElse: orElse,
      );

  @override
  String toString() => value;
}
