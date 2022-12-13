// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as String,
      createdBy: json['createdBy'] as String,
      residentId: json['residentId'] as String,
      shiftId: json['shiftId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      taskStatus:
          $enumDecodeNullable(_$TaskStatusEnumMap, json['taskStatus']) ??
              TaskStatus.pending,
      taskPriority:
          $enumDecodeNullable(_$TaskPriorityEnumMap, json['taskPriority']) ??
              TaskPriority.medium,
      shiftType: $enumDecodeNullable(_$ShiftTypeEnumMap, json['shiftType']) ??
          ShiftType.morning,
      date: const _TaskModelTimestampConverter()
          .fromJson(json['date'] as Timestamp?),
      createdAt: const _TaskModelTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'residentId': instance.residentId,
      'shiftId': instance.shiftId,
      'title': instance.title,
      'description': instance.description,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'taskPriority': _$TaskPriorityEnumMap[instance.taskPriority]!,
      'shiftType': _$ShiftTypeEnumMap[instance.shiftType]!,
      'date': const _TaskModelTimestampConverter().toJson(instance.date),
      'createdAt':
          const _TaskModelTimestampConverter().toJson(instance.createdAt),
    };

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.completed: 'completed',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.urgent: 'urgent',
  TaskPriority.high: 'high',
  TaskPriority.medium: 'medium',
  TaskPriority.low: 'low',
};

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.evening: 'evening',
  ShiftType.night: 'night',
};
