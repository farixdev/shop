class FFirebaseException implements Exception {
  final String code;
  const FFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'Firebase error: $code';
    }
  }

  @override
  String toString() => message;
}
