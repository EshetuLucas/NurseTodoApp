// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResidentModel _$$_ResidentModelFromJson(Map<String, dynamic> json) =>
    _$_ResidentModel(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      roomNumber: json['roomNumber'] as int,
      createdAt: const _UserNullTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['userType']) ??
          UserType.nurse,
    );

Map<String, dynamic> _$$_ResidentModelToJson(_$_ResidentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'age': instance.age,
      'roomNumber': instance.roomNumber,
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
