// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get shiftId => throw _privateConstructorUsedError;
  ShiftType get shiftType => throw _privateConstructorUsedError;
  @_UserNullTimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserType? get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? email,
      String? shiftId,
      ShiftType shiftType,
      @_UserNullTimestampConverter() DateTime? createdAt,
      UserType? userType});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? shiftId = freezed,
    Object? shiftType = null,
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
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as ShiftType,
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
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? email,
      String? shiftId,
      ShiftType shiftType,
      @_UserNullTimestampConverter() DateTime? createdAt,
      UserType? userType});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? shiftId = freezed,
    Object? shiftType = null,
    Object? createdAt = freezed,
    Object? userType = freezed,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftId: freezed == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as ShiftType,
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
class _$_UserModel extends _UserModel {
  _$_UserModel(
      {required this.id,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      this.email,
      this.shiftId,
      this.shiftType = ShiftType.morning,
      @_UserNullTimestampConverter() this.createdAt,
      this.userType = UserType.nurse})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String id;
  @override
  final String? phoneNumber;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? shiftId;
  @override
  @JsonKey()
  final ShiftType shiftType;
  @override
  @_UserNullTimestampConverter()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final UserType? userType;

  @override
  String toString() {
    return 'UserModel(id: $id, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, email: $email, shiftId: $shiftId, shiftType: $shiftType, createdAt: $createdAt, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, firstName,
      lastName, email, shiftId, shiftType, createdAt, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      {required final String id,
      final String? phoneNumber,
      final String? firstName,
      final String? lastName,
      final String? email,
      final String? shiftId,
      final ShiftType shiftType,
      @_UserNullTimestampConverter() final DateTime? createdAt,
      final UserType? userType}) = _$_UserModel;
  _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get id;
  @override
  String? get phoneNumber;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get shiftId;
  @override
  ShiftType get shiftType;
  @override
  @_UserNullTimestampConverter()
  DateTime? get createdAt;
  @override
  UserType? get userType;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
