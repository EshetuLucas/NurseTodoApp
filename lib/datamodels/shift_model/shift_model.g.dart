// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShiftModel _$$_ShiftModelFromJson(Map<String, dynamic> json) =>
    _$_ShiftModel(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      createdAt: const _UserNullTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.nurse,
    );

Map<String, dynamic> _$$_ShiftModelToJson(_$_ShiftModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createdAt':
          const _UserNullTimestampConverter().toJson(instance.createdAt),
      'userType': _$UserTypeEnumMap[instance.userType],
    };

const _$UserTypeEnumMap = {
  UserType.nurse: 'nurse',
  UserType.resident: 'resident',
  UserType.admin: 'admin',
  UserType.staff: 'staff',
};
