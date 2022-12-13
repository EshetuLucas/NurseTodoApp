import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:intl/intl.dart';
import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/app/app.router.dart';
import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';
import 'package:dexter_code_test/datamodels/task_model/task_model.dart';
import 'package:dexter_code_test/enums/bottom_sheet_type.dart';
import 'package:dexter_code_test/services/task_service.dart';
import 'package:dexter_code_test/ui/bottom_sheet/date_picker_bottomsheet.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'add_task_view.form.dart';
import 'package:dexter_code_test/extensions/string_extensions.dart';

class AddTaskViewModel extends FormViewModel {
  final log = getLogger('AddTaskViewModel');
  final _navigationService = locator<NavigationService>();
  final _taskService = locator<TaskService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool get hasTitle => !titleValue.isNullOrEmpty;
  bool get hasDescription => !descriptionValue.isNullOrEmpty;
  bool get hasDate => _selectedDate != null;
  bool _showValidationMessage = false;
  bool get showValidationMessage => _showValidationMessage;
  bool get canAddTask => hasTitle && hasDescription && hasDate;

  ShiftType selectedShift = ShiftType.morning;

  DateTime? _selectedDate;

  String get selectedDate => DateFormat.yMMMMd().format(_selectedDate!);

  ResidentModel? resident;
  bool get hasResident => resident != null;

  void onSelectShiftType(ShiftType shiftType) {
    selectedShift = shiftType;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future<void> onAddResident() async {
    final result = await _navigationService.navigateTo(Routes.residentsView);
    if (result == null) return;
    log.v('selected resident:$result');
    resident = result;
    notifyListeners();
  }

  Future<void> onSelecteDate() async {
    final result = await _bottomSheetService
        .showCustomSheet<dynamic, CalendarDatePickerBottomSheetRequest>(
      title: 'Select Date',
      description:
          'Ethiopian Pulses Oilseeds and Spices processors exporters association',
      variant: BottomSheetType.calendar,
    );
    if (result == null) return;
    _selectedDate = result.data;
    log.v('_selectedDate:$_selectedDate');
  }

  Future<void> onAddTask() async {
    if (!canAddTask) {
      _showValidationMessage = true;
      notifyListeners();
      return;
    }
    final task = TaskModel(
      id: '',
      createdBy: 'userId',
      shiftId: '',
      residentId: resident!.id,
      createdAt: DateTime.now(),
      date: _selectedDate,
      title: titleValue,
      description: descriptionValue,
      shiftType: selectedShift,
    );

    try {
      setBusy(true);
      await _taskService.createTask(task);
      _navigationService.navigateTo(Routes.homeView);
    } catch (e) {
      log.e('Unable to create a task, $e');
      //TODO: show snack bar here
    } finally {
      setBusy(false);
    }
  }
}
