import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/constants/firestore_collection.dart';
import 'package:dexter_code_test/database/firestore_api.dart';
import 'package:dexter_code_test/datamodels/shift_model/shift_model.dart';

class ShiftService extends FirestoreApi<ShiftModel> {
  @override
  get log => getLogger('ShiftService');

  @override
  CollectionReference<ShiftModel> get ref => FirebaseFirestore.instance
      .collection(FirestoreCollection.shifts)
      .withConverter<ShiftModel>(
        fromFirestore: (snapshot, _) => ShiftModel.fromJson(
          snapshot.data()!..['id'] = snapshot.id,
        ),
        toFirestore: (model, _) => model.toJson(),
      );
}
