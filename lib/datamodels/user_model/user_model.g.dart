// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      shiftId: json['shiftId'] as String?,
      shiftType: $enumDecodeNullable(_$ShiftTypeEnumMap, json['shiftType']) ??
          ShiftType.morning,
      createdAt: const _UserNullTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.nurse,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'shiftId': instance.shiftId,
      'shiftType': _$ShiftTypeEnumMap[instance.shiftType]!,
      'createdAt':
          const _UserNullTimestampConverter().toJson(instance.createdAt),
      'userType': _$UserTypeEnumMap[instance.userType],
    };

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.evening: 'evening',
  ShiftType.night: 'night',
};

const _$UserTypeEnumMap = {
  UserType.nurse: 'nurse',
  UserType.resident: 'resident',
  UserType.admin: 'admin',
  UserType.staff: 'staff',
};
