part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ChangeEmailEvent extends LoginEvent {
  ChangeEmailEvent(this.email);

  final String email;
}

class ChangePasswordEvent extends LoginEvent {
  ChangePasswordEvent(this.password);

  final String password;
}

class ChangeShowPasswordEvent extends LoginEvent {
  ChangeShowPasswordEvent();
}

class SignInEvent extends LoginEvent {
  SignInEvent();
}
