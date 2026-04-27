class FFormateException implements Exception {
  final String message;

  const FFormateException([
    this.message = 'Something went wrong. Please Try Again',
  ]);

  factory FFormateException.fromMessage(String message) {
    return FFormateException(message);
  }

  String get formattedMessage => message;

  factory FFormateException.fromCode(String code) {
    final normalizedCode = code.trim().toLowerCase();

    switch (normalizedCode) {
      case 'invalid-email':
      case 'email-invalid':
        return const FFormateException('The email format is invalid.');
      case 'invalid-password':
      case 'password-invalid':
        return const FFormateException('The password format is invalid.');
      case 'invalid-phone':
      case 'invalid-phone-number':
      case 'phone-invalid':
        return const FFormateException('The phone number format is invalid.');
      case 'invalid-url':
      case 'url-invalid':
        return const FFormateException('The URL format is invalid.');
      case 'invalid-date':
      case 'date-invalid':
        return const FFormateException('The date format is invalid.');
      case 'invalid-time':
      case 'time-invalid':
        return const FFormateException('The time format is invalid.');
      case 'invalid-number':
      case 'number-invalid':
        return const FFormateException('The number format is invalid.');
      case 'invalid-json':
      case 'json-invalid':
      case 'json-parse-error':
      case 'parse-error':
        return const FFormateException(
          'The data could not be parsed. Invalid JSON format.',
        );
      case 'invalid-amount':
      case 'amount-invalid':
        return const FFormateException('The amount format is invalid.');
      case 'invalid-card-number':
      case 'card-number-invalid':
        return const FFormateException('The card number format is invalid.');
      case 'invalid-cvv':
      case 'cvv-invalid':
        return const FFormateException('The CVV format is invalid.');
      case 'invalid-expiry-date':
      case 'expiry-date-invalid':
        return const FFormateException('The expiry date format is invalid.');
      case 'invalid-otp':
      case 'otp-invalid':
        return const FFormateException('The OTP format is invalid.');
      case 'invalid-boolean':
      case 'boolean-invalid':
        return const FFormateException('The boolean value format is invalid.');
      case 'invalid-base64':
      case 'base64-invalid':
        return const FFormateException('The Base64 string format is invalid.');
      case 'invalid-uuid':
      case 'uuid-invalid':
        return const FFormateException('The UUID format is invalid.');
      case 'invalid-identifier':
      case 'id-invalid':
        return const FFormateException('The identifier format is invalid.');
      case 'invalid-name':
        return const FFormateException('The name contains invalid characters.');
      case 'invalid-address':
        return const FFormateException('The address format is invalid.');
      case 'invalid-zip':
      case 'postal-code-invalid':
        return const FFormateException('The postal code format is invalid.');
      case 'invalid-currency':
        return const FFormateException('The currency format is invalid.');
      case 'missing-field':
      case 'field-missing':
        return const FFormateException('A required field is missing.');
      case 'malformed-request':
      case 'bad-request':
        return const FFormateException('The request format is malformed.');
      case 'unsupported-format':
        return const FFormateException(
          'The provided data format is not supported.',
        );
      default:
        return FFormateException('Format error: $code');
    }
  }

  @override
  String toString() => formattedMessage;
}
