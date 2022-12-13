import 'package:email_validator/email_validator.dart' as email;

class ValidationResult {
  bool result;
  List<String> reasons;

  ValidationResult(this.result, this.reasons);

  bool get isValid => result;

  factory ValidationResult.failure(List<String> reasons) =>
      ValidationResult(false, reasons);

  factory ValidationResult.success() => ValidationResult(true, []);
}

abstract class Validator<T> {
  ValidationResult validate(T input);
}

class EmailValidator implements Validator<String> {
  static const List<String> defaultReason = [
    "Please input a valid email address"
  ];
  @override
  ValidationResult validate(String input) {
    return email.EmailValidator.validate(input)
        ? ValidationResult.success()
        : ValidationResult.failure(defaultReason);
  }
}

// TODO: migrate this to validator framework
class PasswordValidator {
  static bool hasAtLeast8Characters(String value) =>
      RegExp(r'^.{8,}').hasMatch(value);
}
