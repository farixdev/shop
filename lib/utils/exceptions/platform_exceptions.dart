class FPlatformException implements Exception {
  final String code;
  const FPlatformException(this.code);

  String get message {
    switch (code) {
      case 'ERROR_NETWORK_REQUEST_FAILED':
      case 'network_error':
        return 'Platform network error. Please check your connection.';
      default:
        return 'Platform error: $code';
    }
  }

  @override
  String toString() => message;
}
