import 'package:flutter/foundation.dart';

class FFirebaseAuthException implements Exception {
  final String code;
  const FFirebaseAuthException(this.code);

  String get message {
    if (kDebugMode) {
      print('FirebaseAuthException code: $code');
    }

    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'invalid-verification-code':
        return 'Invalid verification code provided.';
      case 'invalid-verification-id':
        return 'Invalid verification id provided.please register again';
      case 'QuotaExceededError':
        return 'Quota exceeded try again later';
      case 'provider already linked':
        return 'this provider is already linked to another account';
      default:
        return 'Authentication error: $code';
    }
  }

  @override
  String toString() => message;
}
