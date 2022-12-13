import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/enums/user_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();
  factory UserModel(
      {required String id,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? email,
      String? shiftId,
      @Default(ShiftType.morning) ShiftType shiftType,
      @_UserNullTimestampConverter() DateTime? createdAt,
      @Default(UserType.nurse) UserType? userType}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

class _UserNullTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const _UserNullTimestampConverter();

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
