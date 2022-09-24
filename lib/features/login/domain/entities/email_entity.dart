import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class EmailEntity extends FormzInput<String, EmailValidationError> {
  const EmailEntity.pure([String value = '']) : super.pure(value);
  const EmailEntity.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
