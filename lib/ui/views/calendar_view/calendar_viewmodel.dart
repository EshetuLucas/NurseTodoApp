import 'dart:async';

import 'package:clock/clock.dart';
import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/datamodels/task_model/task_model.dart';
import 'package:dexter_code_test/datamodels/user_model/user_model.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/enums/task_status.dart';
import 'package:dexter_code_test/services/authentication_service.dart';
import 'package:dexter_code_test/services/task_service.dart';
import 'package:dexter_code_test/services/user_service.dart';
import 'package:intl/intl.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const _fetchTasksKey = '_fetchTasksKey';
const _fetchSocialsKey = '_fetchSocialsKey';

class CalendarViewModel extends FutureViewModel<List<TaskModel>> {
  final log = getLogger('CalendarViewModel');
  final _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final _taskService = locator<TaskService>();

  UserModel get _currentUser => _userService.currentUser;

  CalendarViewModel(this.currentDate) {
    onSelectedDateChange(currentDate ?? DateTime.now());
  }
  final DateTime? currentDate;

  String get selectedDateText => DateFormat.yMMMMd().format(_selectedDate);

  String searchQuery = '';
  bool get fetchTasksBusy => busy(_fetchTasksKey);
  bool get fetchSocialsKey => busy(_fetchSocialsKey);

  List<int> fetchedMonths = [];
  DateTime now = DateTime.now();

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks
      .where((task) =>
          task.createdAt!.day == _selectedDate.day &&
          task.createdAt!.month == _selectedDate.month &&
          task.createdAt!.year == _selectedDate.year)
      .toList();

  bool _showCalendar = true;
  bool get showCalendar => _showCalendar;

  void onShowCalendar() {
    _showCalendar = !showCalendar;
    notifyListeners();
  }

  Future<void> fetchAllTasks() async {}

  void toMyCalenderView() {}

  void onSearchQueryChange(String value) {
    searchQuery = value;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  String dayFormat(DateTime day) {
    return DateFormat('d').format(day);
  }

  void getSelectedDateTask() {}

  void onSelectedDateChange(DateTime date) {
    _selectedDate = date.toLocal();
    notifyListeners();
    getSelectedDateTask();
  }

  void showTaskDetails(TaskModel task) {}

  Future<void> onMarkAdDone(TaskModel task) async {
    TaskModel taskToBeUpdated = task.copyWith(taskStatus: TaskStatus.completed);
    try {
      setBusy(true);
      await _taskService.update(documentId: task.id, payload: taskToBeUpdated);
    } catch (e) {
      // TODO: show error message
    } finally {
      setBusy(false);
    }
    initialise();
  }

  Future<void> onTransferTask(
    TaskModel task,
  ) async {
    log.i('userShift: ${_currentUser.shiftType}');
    ShiftType nextShift;

    switch (_currentUser.shiftType) {
      case ShiftType.evening:
        nextShift = ShiftType.night;
        break;
      case ShiftType.morning:
        nextShift = ShiftType.evening;
        break;
      case ShiftType.night:
        nextShift = ShiftType.morning;
        break;
    }
    TaskModel taskToBeUpdated = task.copyWith(
      shiftType: nextShift,
    );
    try {
      setBusy(true);
      await _taskService.update(documentId: task.id, payload: taskToBeUpdated);
    } catch (e) {
      // TODO: show error message
    } finally {
      setBusy(false);
    }
    initialise();
  }

  @override
  Future<List<TaskModel>> futureToRun() async {
    return await _taskService.getTaskByShiftType(
      shiftType: _currentUser.shiftType,
    );
  }

  @override
  void onData(List<TaskModel>? data) {
    if (data != null) {
      _tasks = data;
    }
  }
}
