part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState(this.loginForm);

  final LoginFormEntity loginForm;
}

class InitialState extends LoginState {
  const InitialState(super.loginForm);
}

class EmailChangedState extends LoginState {
  const EmailChangedState(super.loginForm);
}

class PasswordChangedState extends LoginState {
  const PasswordChangedState(super.loginForm);
}

class ShowPasswordChangedState extends LoginState {
  const ShowPasswordChangedState(super.loginForm);
}

class LoadingState extends LoginState {
  const LoadingState(super.loginForm);
}

class InvalidCredentialsState extends LoginState {
  const InvalidCredentialsState(super.loginForm);
}

class FailedState extends LoginState {
  const FailedState(super.loginForm);
}

class SuccessLoginState extends LoginState {
  const SuccessLoginState(super.loginForm);
}
