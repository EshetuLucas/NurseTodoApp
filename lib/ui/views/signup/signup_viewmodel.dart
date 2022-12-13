import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/services/authentication_service.dart';
import 'package:dexter_code_test/services/user_service.dart';
import 'package:email_validator/email_validator.dart';

import 'package:dexter_code_test/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dexter_code_test/ui/views/signup/signup_view.form.dart';
import 'package:dexter_code_test/extensions/string_extensions.dart';

const String loginView = '/login-view';

class SignUpViewModel extends FormViewModel {
  final log = getLogger('SignUpSheetViewModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  String? _emailValidationMessage;
  String? get emailValidationMessage => _emailValidationMessage;
  String _erroMessage = '';
  String get erroMessage => _erroMessage;
  String? _passwordValidationMessage;
  String? get passwordValidationMessage => _passwordValidationMessage;

  bool _showValidation = false;
  bool get showValidation => _showValidation;

  bool get nameFieldHasText => _showValidation && firstNameValue.isNullOrEmpty;
  bool get emailFieldHasText => _showValidation && emailValue.isNullOrEmpty;
  bool get passwordFieldHasText =>
      _showValidation && passwordValue.isNullOrEmpty;
  bool get confirmFieldHasText =>
      _showValidation && confirmPasswordValue.isNullOrEmpty;

  bool get enableCreateAccountButton =>
      emailValidationMessage == null &&
      passwordValidationMessage == null &&
      !passwordValue.isNullOrEmpty &&
      !firstNameValue.isNullOrEmpty &&
      !confirmPasswordValue.isNullOrEmpty;

  bool _validatePassword() {
    if (!passwordFieldHasText && !confirmFieldHasText) {
      if (passwordValue!.length < 6) {
        _passwordValidationMessage =
            'Please enter a password that\'s 6 characters or longer';
        notifyListeners();
        return false;
      } else if (passwordValue != confirmPasswordValue) {
        _passwordValidationMessage = 'Password and confrim password must match';
        notifyListeners();
      } else {
        _passwordValidationMessage = null;
      }
    }
    return true;
  }

  void onBack() => _navigationService.back();

  Future<void> onCreateAccount() async {
    _showValidation = true;
    _validatePassword();

    notifyListeners();
    if (enableCreateAccountButton) {
      setBusy(true);

      try {
        final result = await _authService.createAccountWithEmail(
          email: (emailValue ?? '').trim(),
          password: passwordValue ?? '',
          fistName: firstNameValue ?? '',
          lastName: lastNameValue ?? '',
        );
        if (result.hasError) {
          // TODO: show erro message
          return;
        }
        return await _navigationService.clearStackAndShow(Routes.homeView);
      } catch (e) {
        log.e(e);
        // TODO: show erro message
      } finally {
        setBusy(false);
      }
    }
    setBusy(false);
  }

  Future<void> navigateToHomeView() async {
    await _navigationService.clearStackAndShow(Routes.homeView);
  }

  @override
  void setFormStatus() {}

  List<bool> _checkBoxValue = [false, false];
  List<bool> get checkBoxValue => _checkBoxValue;

  void onCheckBoxChange(int index, bool value) {
    _checkBoxValue[index] = value;
    if (index == 1) {
      _checkBoxValue[index - 1] = !value;
    } else
      _checkBoxValue[index + 1] = !value;

    notifyListeners();
  }
}
