import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';
import 'package:dexter_code_test/services/resident_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'create_resident_view.form.dart';
import 'package:dexter_code_test/extensions/string_extensions.dart';

class CreateResidentViewModel extends FormViewModel {
  final log = getLogger('CreateResidentViewModel');
  final _navigationService = locator<NavigationService>();
  final _residentService = locator<ResidentService>();

  bool get hasFullName => !fullNameValue.isNullOrEmpty;
  bool get hasAge => !ageValue.isNullOrEmpty;
  bool get hasGender => !genderValue.isNullOrEmpty;
  bool get hasRoomNumber => !roomNumberValue.isNullOrEmpty;

  bool get canCreateResident =>
      hasFullName && hasAge && hasGender && hasRoomNumber;
  bool _showValidationMessage = false;
  bool get showValidationMessage => _showValidationMessage;

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future<void> onCreate() async {
    if (!canCreateResident) {
      _showValidationMessage = true;
      notifyListeners();
      return;
    }
    ResidentModel residentModel = ResidentModel(
      id: '',
      fullName: fullNameValue!,
      gender: genderValue!,
      age: int.parse(ageValue!),
      roomNumber: int.parse(
        roomNumberValue!,
      ),
    );

    try {
      setBusy(true);
      await _residentService.create(payload: residentModel);
      _navigationService.back();
    } catch (e) {
      log.e('Unable to create a resident, $e');
    } finally {
      setBusy(false);
    }
  }
}
