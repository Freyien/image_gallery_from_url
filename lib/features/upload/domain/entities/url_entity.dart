import 'package:formz/formz.dart';

enum UrlValidationError { invalid }

class UrlEntity extends FormzInput<String, UrlValidationError> {
  const UrlEntity.pure([String value = '']) : super.pure(value);
  const UrlEntity.dirty([String value = '']) : super.dirty(value);

  @override
  UrlValidationError? validator(String value) {
    if (value.startsWith('http://')) {
      return null;
    } else if (value.startsWith('https://')) {
      return null;
    } else if (value.startsWith('www.')) {
      return null;
    }

    return UrlValidationError.invalid;
  }
}
