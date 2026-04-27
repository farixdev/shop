class FFormateException implements Exception {
  const FFormateException();

  String get message => 'Invalid data format. Please check your input.';

  @override
  String toString() => message;
}

