// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get id => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  String get residentId => throw _privateConstructorUsedError;
  String? get shiftId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  TaskStatus get taskStatus => throw _privateConstructorUsedError;
  TaskPriority get taskPriority => throw _privateConstructorUsedError;
  ShiftType get shiftType => throw _privateConstructorUsedError;
  @_TaskModelTimestampConverter()
  DateTime? get date => throw _privateConstructorUsedError;
  @_TaskModelTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String id,
      String createdBy,
      String residentId,
      String? shiftId,
      String? title,
      String? description,
      TaskStatus taskStatus,
      TaskPriority taskPriority,
      ShiftType shiftType,
      @_TaskModelTimestampConverter() DateTime? date,
      @_TaskModelTimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? residentId = null,
    Object? shiftId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? taskStatus = null,
    Object? taskPriority = null,
    Object? shiftType = null,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      residentId: null == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatus: null == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      taskPriority: null == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as ShiftType,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdBy,
      String residentId,
      String? shiftId,
      String? title,
      String? description,
      TaskStatus taskStatus,
      TaskPriority taskPriority,
      ShiftType shiftType,
      @_TaskModelTimestampConverter() DateTime? date,
      @_TaskModelTimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$_TaskModel>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? residentId = null,
    Object? shiftId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? taskStatus = null,
    Object? taskPriority = null,
    Object? shiftType = null,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_TaskModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      residentId: null == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as String,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      taskStatus: null == taskStatus
          ? _value.taskStatus
          : taskStatus // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      taskPriority: null == taskPriority
          ? _value.taskPriority
          : taskPriority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as ShiftType,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel extends _TaskModel {
  _$_TaskModel(
      {required this.id,
      required this.createdBy,
      required this.residentId,
      this.shiftId,
      this.title,
      this.description,
      this.taskStatus = TaskStatus.pending,
      this.taskPriority = TaskPriority.medium,
      this.shiftType = ShiftType.morning,
      @_TaskModelTimestampConverter() this.date,
      @_TaskModelTimestampConverter() this.createdAt})
      : super._();

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  final String id;
  @override
  final String createdBy;
  @override
  final String residentId;
  @override
  final String? shiftId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey()
  final TaskStatus taskStatus;
  @override
  @JsonKey()
  final TaskPriority taskPriority;
  @override
  @JsonKey()
  final ShiftType shiftType;
  @override
  @_TaskModelTimestampConverter()
  final DateTime? date;
  @override
  @_TaskModelTimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TaskModel(id: $id, createdBy: $createdBy, residentId: $residentId, shiftId: $shiftId, title: $title, description: $description, taskStatus: $taskStatus, taskPriority: $taskPriority, shiftType: $shiftType, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.residentId, residentId) ||
                other.residentId == residentId) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.taskStatus, taskStatus) ||
                other.taskStatus == taskStatus) &&
            (identical(other.taskPriority, taskPriority) ||
                other.taskPriority == taskPriority) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdBy,
      residentId,
      shiftId,
      title,
      description,
      taskStatus,
      taskPriority,
      shiftType,
      date,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(
      this,
    );
  }
}

abstract class _TaskModel extends TaskModel {
  factory _TaskModel(
          {required final String id,
          required final String createdBy,
          required final String residentId,
          final String? shiftId,
          final String? title,
          final String? description,
          final TaskStatus taskStatus,
          final TaskPriority taskPriority,
          final ShiftType shiftType,
          @_TaskModelTimestampConverter() final DateTime? date,
          @_TaskModelTimestampConverter() final DateTime? createdAt}) =
      _$_TaskModel;
  _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  String get id;
  @override
  String get createdBy;
  @override
  String get residentId;
  @override
  String? get shiftId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  TaskStatus get taskStatus;
  @override
  TaskPriority get taskPriority;
  @override
  ShiftType get shiftType;
  @override
  @_TaskModelTimestampConverter()
  DateTime? get date;
  @override
  @_TaskModelTimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
