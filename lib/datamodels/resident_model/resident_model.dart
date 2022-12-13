import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/enums/user_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident_model.freezed.dart';
part 'resident_model.g.dart';

@freezed
class ResidentModel with _$ResidentModel {
  ResidentModel._();
  factory ResidentModel(
      {required String id,
      String? phoneNumber,
      required String fullName,
      required String gender,
      required int age,
      required int roomNumber,
      @_UserNullTimestampConverter() DateTime? createdAt,
      @Default(UserType.nurse) UserType? userType}) = _ResidentModel;

  factory ResidentModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentModelFromJson(json);
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
