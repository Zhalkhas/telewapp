enum ContactRequestStatus {
  sent('sent'),
  cancelled('cancelled');

  final String value;

  const ContactRequestStatus(this.value);

  factory ContactRequestStatus.fromString(
    String status, {
    ContactRequestStatus Function()? orElse,
  }) =>
      ContactRequestStatus.values.firstWhere(
        (e) => '$e' == status,
        orElse: orElse,
      );

  @override
  String toString() => value;
}
