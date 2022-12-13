import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/constants/firestore_collection.dart';
import 'package:dexter_code_test/database/firestore_api.dart';
import 'package:dexter_code_test/datamodels/user_model/user_model.dart';
import 'package:dexter_code_test/exceptions/firestore_api_exception.dart';

class UserService extends FirestoreApi<UserModel> {
  @override
  get log => getLogger('UserService');

  @override
  CollectionReference<UserModel> get ref => FirebaseFirestore.instance
      .collection(FirestoreCollection.users)
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(
          snapshot.data()!..['id'] = snapshot.id,
        ),
        toFirestore: (model, _) => model.toJson(),
      );

  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  void setCurrentUser(UserModel user) => _currentUser = user;

  Future<void> createWithId({
    required String documentId,
    required UserModel payload,
  }) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    await ref.doc(documentId).set(payload, SetOptions(merge: true));
  }

  /// Returns a list of [UserModel] that match the userId in [playerIds]
  Future<List<UserModel>> getUserByIds({
    required List<String> playerIds,
  }) async {
    log.i('playerIds:$playerIds');

    if (playerIds.isNotEmpty) {
      /// TODO: Create chunks of playerIds as Firestore supports maximum of
      ///  10 values while using "in" query
      final results =
          await ref.where('id', whereIn: playerIds.take(10).toList()).get();
      final playersData = results.docs.map((player) => player.data()).toList();

      log.v('Players found for ids $playerIds.\nData:\n$playersData');
      return playersData;
    }

    return [];
  }

  /// Returns a list of [UserModel] that match the query clientId isEqualTo [clientId]
  Future<List<UserModel>> getUserByShiftId({
    required String clientId,
    List<String>? whereNotIn,
    int limit = 100,
  }) async {
    log.i('clientId:$clientId');

    if (clientId.isEmpty) {
      throw FirestoreApiException(
        message: 'No clientId supplied',
        devDetails: 'You have to supply a clientId.',
      );
    }

    var _ref = ref
        // TODO: Add clientId filter when its available on the backend
        // .where('clientId', isEqualTo: clientId)
        .limit(limit);

    if (whereNotIn != null && whereNotIn.isNotEmpty) {
      _ref = _ref.where('id', whereNotIn: whereNotIn);
    }

    final matchingResults = await _ref.get();

    final playersData = matchingResults.docs.map((player) {
      return player.data();
    }).toList();

    log.v('Players found for clientId $clientId.\nData:\n$playersData');

    return playersData;
  }
}
