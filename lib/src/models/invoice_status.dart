/// Status of invoice which is closed
enum InvoiceStatus {
  /// Invoice was paid successfully
  paid('paid'),

  /// User closed this invoice without paying
  cancelled('cancelled'),

  /// User tried to pay, but the payment was failed
  failed('failed'),

  /// The payment is still processing.
  /// The bot will receive a service message about
  /// a successful payment when the payment is successfully paid.
  pending('pending');

  final String value;

  const InvoiceStatus(this.value);

  factory InvoiceStatus.fromString(
    String status, {
    InvoiceStatus Function()? orElse,
  }) =>
      InvoiceStatus.values.firstWhere(
        (e) => '$e' == status,
        orElse: orElse,
      );

  @override
  String toString() => value;
}
