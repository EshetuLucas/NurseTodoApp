import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/app/app.router.dart';
import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';
import 'package:dexter_code_test/services/resident_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

ResidentModel get fakeResident => ResidentModel(
    id: "",
    fullName: 'Duka Lukas Teka ',
    gender: 'Male',
    age: 20,
    roomNumber: 14);

class ResidentsViewModel extends FutureViewModel<List<ResidentModel>> {
  final log = getLogger('ResidentsViewModel');
  final _navigationService = locator<NavigationService>();
  final _residentService = locator<ResidentService>();

  String _searchKeyWord = '';
  bool get isSearching => _searchKeyWord.isNotEmpty;

  List<ResidentModel> _residents = [];
  List<ResidentModel> get residents {
    if (_residents.isNotEmpty && _searchKeyWord.isNotEmpty) {
      return List.from(_residents
          .where((resident) =>
              resident.fullName.toLowerCase().contains(_searchKeyWord))
          .toList());
    }
    return _residents;
  }

  void onSearchTextChange(String value) {
    _searchKeyWord = value.toLowerCase();
    notifyListeners();
  }

  Future<List<ResidentModel>> getAllResidents() async {
    final result = await _residentService.getAllResidents();

    log.e(result);

    return result;
  }

  void onResidentTap(ResidentModel resident) {
    _navigationService.back(result: resident);
  }

  Future<void> onCreateResident() async {
    await Future.delayed(const Duration(seconds: 3));
    await _navigationService.navigateTo(Routes.createResidentView);

    initialise();
  }

  @override
  Future<List<ResidentModel>> futureToRun() async {
    return await _residentService.getAllResidents();
  }

  @override
  void onData(List<ResidentModel>? data) {
    super.onData(data);
    if (data != null) {
      _residents = data;
    }
  }
}
