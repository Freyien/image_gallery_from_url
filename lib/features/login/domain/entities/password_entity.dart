import 'package:formz/formz.dart';

enum PasswordError { empty }

class PasswordEntity extends FormzInput<String, PasswordError> {
  const PasswordEntity.pure([String value = '']) : super.pure(value);
  const PasswordEntity.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return PasswordError.empty;
    }

    return null;
  }
}
