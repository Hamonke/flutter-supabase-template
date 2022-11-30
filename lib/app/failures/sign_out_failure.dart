abstract class SignOutFailure {
  const SignOutFailure();

  String get mapToErrorMessage {
    switch (runtimeType) {
      case ExecutionErrorSignOutFailure:
        return 'Error when making sign out request';
    }

    return 'Unexpected error, please try again';
  }
}

class ExecutionErrorSignOutFailure extends SignOutFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorSignOutFailure(this.error, this.stackTrace);
}
