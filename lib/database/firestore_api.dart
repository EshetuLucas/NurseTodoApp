import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/exceptions/firestore_api_exception.dart';
import 'package:logger/logger.dart';

abstract class FirestoreApi<T> {
  Logger get log;

  /// The collection reference to a Firestore data.
  ///
  /// Must add implementation for passing in the data model.
  ///
  /// Creating a collection reference
  ///
  /// ```dart
  /// FirebaseFirestore.instance.collection('users')
  ///   .withConverter<UserModel>(
  ///     fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  ///     toFirestore: (model, _) => model.toJson(),
  ///   );
  /// ```
  ///
  /// Creating a sub-collection reference
  ///
  /// ```dart
  /// CollectionReference<UserNotification> _notificationsRef(
  ///   String documentId,
  /// ) {
  ///   return ref
  ///       .doc(documentId)
  ///       .collection('notifications')
  ///       .withConverter<UserNotification>(
  ///         fromFirestore: (snapshot, _) => UserNotification.fromJson(
  ///           snapshot.data()!..['id'] = snapshot.id,
  ///         ),
  ///         toFirestore: (model, _) => model.toJson(),
  ///       );
  /// }
  /// ```

  CollectionReference<T> get ref;

  /// This function generate a new document Id and returns the generated
  /// id to the caller function. We use if we want to know the id and use
  /// it before creating a document.
  String getNewDocId() {
    final uid = ref.doc().id;
    log.v('Generated uid "$uid"');
    return uid;
  }

  /// This function fetchs a list given type [T] data from firestore
  /// and returns the list.
  Future<List<T>> all({int limit = 9999}) async {
    log.v('limit value "$limit"');

    try {
      final doc = await ref.limit(limit).get();
      log.i(doc.toString());

      return doc.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> find({required String documentId}) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      final doc = await ref.doc(documentId).get();

      if (!doc.exists) {
        return null;
      }
      return doc.data()!;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create({required T payload, String? documentId}) async {
    log.v('documentId value "$documentId", payload $payload');

    try {
      await ref.doc(documentId ?? getNewDocId()).set(payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({
    required String documentId,
    required T payload,
  }) async {
    log.v('documentId value "$documentId", payload $payload');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    final options = SetOptions(merge: true);

    try {
      await ref.doc(documentId).set(payload, options);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> onlyUpdate({
    required String documentId,
    required Map<String, Object?> payload,
  }) async {
    log.v('documentId value "$documentId" | payload: $payload');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      await ref.doc(documentId).update(payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete({required String documentId}) async {
    log.v('documentId value "$documentId"');

    if (documentId.isEmpty) {
      throw emptyFieldException();
    }

    try {
      await ref.doc(documentId).delete();
    } catch (e) {
      rethrow;
    }
  }

  /// Custom firestore api exceptions

  FirestoreApiException emptyFieldException({String field = 'documentId'}) {
    return FirestoreApiException(
      message: 'The $field is empty',
      devDetails: 'The $field must contain a value',
    );
  }

  /// Not nessecary for this specific task but, what i wanted to show here
  /// is this class is [abstract] class and as developer before even we use
  /// all this function we need to implement a comman firebase functions, this
  /// is because we will definetly use them when we add a new features into
  /// the app.

  /// Parameter [whereNotIn] should only be a maximum of 10, otherwise
  /// it throws a Firestore query exception where it should not exceed 10
  Future<List<T>> whereNotIn(List<String> whereNotIn) async {
    log.v('whereNotIn "$whereNotIn"');

    try {
      final doc = await ref.where('id', whereNotIn: whereNotIn).get();

      return doc.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<T>> subscribeAll({int? limit}) {
    log.v('limit value "$limit"');

    try {
      final snapshots = ref.limit(limit ?? 9999).snapshots();
      return snapshots
          .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
    } catch (e) {
      rethrow;
    }
  }
}
