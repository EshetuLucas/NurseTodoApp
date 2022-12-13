import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/constants/firestore_collection.dart';
import 'package:dexter_code_test/database/firestore_api.dart';
import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';

class ResidentService extends FirestoreApi<ResidentModel> {
  @override
  get log => getLogger('ResidentService');

  @override
  CollectionReference<ResidentModel> get ref => FirebaseFirestore.instance
      .collection(FirestoreCollection.residents)
      .withConverter<ResidentModel>(
        fromFirestore: (snapshot, _) => ResidentModel.fromJson(
          snapshot.data()!..['id'] = snapshot.id,
        ),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<void> createWithId({
    required String documentId,
    required ResidentModel payload,
  }) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    await ref.doc(documentId).set(payload, SetOptions(merge: true));
  }

  /// Returns a list of [UserModel] that match the userId in [playerIds]
  Future<List<ResidentModel>> getResidentByIds({
    required List<String> ResidentIds,
  }) async {
    log.i('ResidentIds:$ResidentIds');

    if (ResidentIds.isNotEmpty) {
      final results =
          await ref.where('id', whereIn: ResidentIds.take(10).toList()).get();
      final residentData =
          results.docs.map((resident) => resident.data()).toList();

      log.v('Resident found for ids $ResidentIds.\nData:\n$residentData');
      return residentData;
    }

    return [];
  }

  Future<List<ResidentModel>> getAllResidents({int limit = 99}) async {
    try {
      final results = await ref
          .limit(limit)
          .orderBy(
            'createdAt',
            descending: false,
          )
          .get();
      final tasks = results.docs.map((tasks) => tasks.data()).toList();
      log.v('esidents found.\nData:\n$tasks');
      return tasks;
    } catch (e) {
      log.e('Unable to get resident, $e');
      rethrow;
    }
  }
}
