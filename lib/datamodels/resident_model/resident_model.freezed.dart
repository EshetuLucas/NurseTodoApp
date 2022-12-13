// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResidentModel _$ResidentModelFromJson(Map<String, dynamic> json) {
  return _ResidentModel.fromJson(json);
}

/// @nodoc
mixin _$ResidentModel {
  String get id => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get roomNumber => throw _privateConstructorUsedError;
  @_UserNullTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserType? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidentModelCopyWith<ResidentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentModelCopyWith<$Res> {
  factory $ResidentModelCopyWith(
          ResidentModel value, $Res Function(ResidentModel) then) =
      _$ResidentModelCopyWithImpl<$Res, ResidentModel>;
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String fullName,
      String gender,
      int age,
      int roomNumber,
      @_UserNullTimestampConverter() DateTime? createdAt,
      UserType? userType});
}

/// @nodoc
class _$ResidentModelCopyWithImpl<$Res, $Val extends ResidentModel>
    implements $ResidentModelCopyWith<$Res> {
  _$ResidentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? fullName = null,
    Object? gender = null,
    Object? age = null,
    Object? roomNumber = null,
    Object? createdAt = freezed,
    Object? userType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResidentModelCopyWith<$Res>
    implements $ResidentModelCopyWith<$Res> {
  factory _$$_ResidentModelCopyWith(
          _$_ResidentModel value, $Res Function(_$_ResidentModel) then) =
      __$$_ResidentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String fullName,
      String gender,
      int age,
      int roomNumber,
      @_UserNullTimestampConverter() DateTime? createdAt,
      UserType? userType});
}

/// @nodoc
class __$$_ResidentModelCopyWithImpl<$Res>
    extends _$ResidentModelCopyWithImpl<$Res, _$_ResidentModel>
    implements _$$_ResidentModelCopyWith<$Res> {
  __$$_ResidentModelCopyWithImpl(
      _$_ResidentModel _value, $Res Function(_$_ResidentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? fullName = null,
    Object? gender = null,
    Object? age = null,
    Object? roomNumber = null,
    Object? createdAt = freezed,
    Object? userType = freezed,
  }) {
    return _then(_$_ResidentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      roomNumber: null == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResidentModel extends _ResidentModel {
  _$_ResidentModel(
      {required this.id,
      this.phoneNumber,
      required this.fullName,
      required this.gender,
      required this.age,
      required this.roomNumber,
      @_UserNullTimestampConverter() this.createdAt,
      this.userType = UserType.nurse})
      : super._();

  factory _$_ResidentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResidentModelFromJson(json);

  @override
  final String id;
  @override
  final String? phoneNumber;
  @override
  final String fullName;
  @override
  final String gender;
  @override
  final int age;
  @override
  final int roomNumber;
  @override
  @_UserNullTimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final UserType? userType;

  @override
  String toString() {
    return 'ResidentModel(id: $id, phoneNumber: $phoneNumber, fullName: $fullName, gender: $gender, age: $age, roomNumber: $roomNumber, createdAt: $createdAt, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResidentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, fullName,
      gender, age, roomNumber, createdAt, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResidentModelCopyWith<_$_ResidentModel> get copyWith =>
      __$$_ResidentModelCopyWithImpl<_$_ResidentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResidentModelToJson(
      this,
    );
  }
}

abstract class _ResidentModel extends ResidentModel {
  factory _ResidentModel(
      {required final String id,
      final String? phoneNumber,
      required final String fullName,
      required final String gender,
      required final int age,
      required final int roomNumber,
      @_UserNullTimestampConverter() final DateTime? createdAt,
      final UserType? userType}) = _$_ResidentModel;
  _ResidentModel._() : super._();

  factory _ResidentModel.fromJson(Map<String, dynamic> json) =
      _$_ResidentModel.fromJson;

  @override
  String get id;
  @override
  String? get phoneNumber;
  @override
  String get fullName;
  @override
  String get gender;
  @override
  int get age;
  @override
  int get roomNumber;
  @override
  @_UserNullTimestampConverter()
  DateTime? get createdAt;
  @override
  UserType? get userType;
  @override
  @JsonKey(ignore: true)
  _$$_ResidentModelCopyWith<_$_ResidentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
