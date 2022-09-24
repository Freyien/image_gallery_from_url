import 'package:formz/formz.dart';

import 'entities.dart';

class LoginFormEntity with FormzMixin {
  LoginFormEntity({
    this.email = const EmailEntity.pure(),
    this.password = const PasswordEntity.pure(),
    this.showPassword = false,
  });

  final EmailEntity email;
  final PasswordEntity password;
  final bool showPassword;

  LoginFormEntity copyWith({
    EmailEntity? email,
    PasswordEntity? password,
    bool? showPassword,
  }) {
    return LoginFormEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<FormzInput> get inputs => [email, password];
}
