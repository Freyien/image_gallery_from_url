part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState(this.loginForm);

  final LoginFormEntity loginForm;
}

class InitialState extends LoginState {
  const InitialState(LoginFormEntity loginForm) : super(loginForm);
}

class EmailChangedState extends LoginState {
  const EmailChangedState(LoginFormEntity loginForm) : super(loginForm);
}

class PasswordChangedState extends LoginState {
  const PasswordChangedState(LoginFormEntity loginForm) : super(loginForm);
}

class ShowPasswordChangedState extends LoginState {
  const ShowPasswordChangedState(LoginFormEntity loginForm) : super(loginForm);
}

class LoadingState extends LoginState {
  const LoadingState(LoginFormEntity loginForm) : super(loginForm);
}

class InvalidCredentialsState extends LoginState {
  const InvalidCredentialsState(LoginFormEntity loginForm) : super(loginForm);
}

class FailedState extends LoginState {
  const FailedState(LoginFormEntity loginForm) : super(loginForm);
}

class SuccessLoginState extends LoginState {
  const SuccessLoginState(LoginFormEntity loginForm) : super(loginForm);
}
