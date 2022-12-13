import 'package:dexter_code_test/extensions/string_extensions.dart';
import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/app/app.router.dart';
import 'package:dexter_code_test/services/authentication_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  final emailValidator = EmailValidator();

  bool get isEmailValid => EmailValidator.validate((emailValue ?? '').trim());

  bool get hasEmailAndPassword => isEmailValid && !passwordValue.isNullOrEmpty;

  @override
  void setFormStatus() {}

  Future<void> loginWithEmail() async {
    setBusy(true);

    try {
      final result = await _authService.loginWithEmail(
        email: (emailValue ?? '').trim(),
        password: passwordValue ?? '',
      );

      if (result.hasError) {
        log.e(result.errorMessage);
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

  void onSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  Future<void> signInWithGoogle() async {}

  Future<void> useFacebookAuthentication() async {}

  Future<void> useAppleAuthentication() async {}

  void _setErrorMessage(Object e, {required String provider}) {
    log.e('Unable to login. $e');
    setValidationMessage('We are unable to sign you in with $provider.');
    notifyListeners();
  }

  void toResetPasswordView() {}
}
