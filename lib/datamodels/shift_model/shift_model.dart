import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/enums/user_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

@freezed
class ShiftModel with _$ShiftModel {
  ShiftModel._();
  factory ShiftModel(
      {required String id,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? email,
      @_UserNullTimestampConverter() DateTime? createdAt,
      @Default(UserType.nurse) UserType? userType}) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);
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
