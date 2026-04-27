class FFirebaseException implements Exception {
  final String code;
  const FFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'unknown':
        return 'An unknown error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'the custom token format is incorrect.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-not-found':
        return 'No user corresponding to the given email address was found.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'wrong-password':
        return 'The password is invalid for the given email address.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-credential':
        return 'The supplied auth credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification id is invalid.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'account-exists-with-different-credential':
        return 'account-exists-with-different-credential';
        
      default:
        return 'Firebase error: $code';
    }
  }

  @override
  String toString() => message;
}
