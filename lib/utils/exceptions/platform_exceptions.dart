class FPlatformException implements Exception {
  final String code;
  const FPlatformException(this.code);

  String get message {
    final normalizedCode = code.trim().toLowerCase();

    switch (normalizedCode) {
      case 'error_network_request_failed':
      case 'network_error':
        return 'Platform network error. Please check your connection.';
      case 'error_cancelled':
      case 'cancelled':
      case 'user_cancelled':
        return 'The operation was cancelled.';
      case 'error_not_implemented':
      case 'not_implemented':
      case 'missing_plugin':
        return 'This feature is not implemented on the current platform.';
      case 'error_null_pointer':
      case 'null_pointer':
        return 'A null value was encountered unexpectedly.';
      case 'error_illegal_argument':
      case 'illegal_argument':
      case 'bad_arguments':
      case 'invalid_argument':
        return 'An invalid argument was provided.';
      case 'error_failed_not_fetched':
      case 'failed_not_fetched':
      case 'fetch_failed':
        return 'The required data could not be fetched.';
      case 'permission_denied':
      case 'error_permission_denied':
        return 'Permission denied. Please check your app permissions.';
      case 'error_authentication_failed':
      case 'authentication_failed':
      case 'invalid_credential':
        return 'Authentication failed. Please sign in again.';
      case 'error_invalid_email':
      case 'invalid_email':
        return 'The email provided is invalid.';
      case 'error_wrong_password':
      case 'wrong_password':
        return 'The password provided is incorrect.';

      case 'error_timeout':
      case 'timeout':
        return 'The operation timed out. Please try again.';
      case 'error_connection':
      case 'connection_error':
      case 'connection_failed':
        return 'Could not connect to the service. Check your network.';
      case 'error_unavailable':
      case 'service_unavailable':
        return 'The service is currently unavailable. Try again later.';
      case 'error_invalid_state':
      case 'invalid_state':
        return 'The system is in an invalid state for this operation.';
      case 'error_illegal_state':
      case 'illegal_state':
        return 'The application state is illegal for this action.';
      case 'timeout_exception':
        return 'The request timed out. Please retry.';
      case 'error_unknown':
      case 'unknown':
        return 'An unknown platform error occurred. Please try again.';
      case 'error_format':
      case 'format_error':
      case 'invalid_format':
        return 'The data format is invalid.';
      case 'error_permission':
        return 'The operation is not permitted.';
      case 'error_canceled':
        return 'The action was canceled.';
      case 'error':
      case 'failure':
        return 'A platform error occurred. Please try again.';
      default:
        return 'Platform error: $code';
    }
  }

  @override
  String toString() => message;
}
