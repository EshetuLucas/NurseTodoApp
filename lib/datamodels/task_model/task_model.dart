import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/enums/task_priority.dart';
import 'package:dexter_code_test/enums/task_status.dart';
import 'package:dexter_code_test/enums/user_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  TaskModel._();
  factory TaskModel({
    required String id,
    required String createdBy,
    required String residentId,
    String? shiftId,
    String? title,
    String? description,
    @Default(TaskStatus.pending) TaskStatus taskStatus,
    @Default(TaskPriority.medium) TaskPriority taskPriority,
    @Default(ShiftType.morning) ShiftType shiftType,
    @_TaskModelTimestampConverter() DateTime? date,
    @_TaskModelTimestampConverter() DateTime? createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

class _TaskModelTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const _TaskModelTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) {
    if (timestamp == null) return null;
    return timestamp.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) {
    if (date == null) return null;
    return Timestamp.fromDate(date);
  }
}
