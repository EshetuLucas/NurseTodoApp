import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/app/app.router.dart';
import 'package:dexter_code_test/datamodels/user_model/user_model.dart';
import 'package:dexter_code_test/enums/shift_type.dart';

import 'package:dexter_code_test/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountViewModel extends BaseViewModel {
  final log = getLogger('AccountViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  bool get hasUser => true;
  UserModel get currentUser => _userService.currentUser;

  late ShiftType _selectedShift = currentUser.shiftType;
  ShiftType get selectedShift => _selectedShift;

  void onSelectShiftType(ShiftType shiftType) {
    _selectedShift = shiftType;
    // Should be async call, we don't have to await for this call
    onChangeShift();
    notifyListeners();
  }

  Future<void> onChangeShift() async {
    UserModel userToBeUpdated = currentUser.copyWith(shiftType: _selectedShift);
    try {
      setBusy(true);
      await _userService.update(
          documentId: currentUser.id, payload: userToBeUpdated);
      _userService.setCurrentUser(userToBeUpdated);
    } catch (e) {
      // TODO: show error message
    } finally {
      setBusy(false);
    }
  }

  String get userFullName =>
      currentUser.firstName! + ' ' + currentUser.lastName!;

  Future<void> onOptionTap(int index) async {
    log.i('index:$index');

    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        await onLogout();
        break;
      default:
    }
  }

  Future<void> onCamera() async {}

  Future<void> onPreference() async {}

  Future<void> onAbout() async {}

  Future<void> onLogout() async {
    //await _userService.logOut();
    await _navigationService.clearStackAndShow(Routes.loginView);
  }
}
