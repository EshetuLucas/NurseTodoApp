import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/constants/firestore_collection.dart';
import 'package:dexter_code_test/database/firestore_api.dart';
import 'package:dexter_code_test/datamodels/task_model/task_model.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/extensions/string_extensions.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TaskService extends FirestoreApi<TaskModel> {
  @override
  get log => getLogger('TaskService');

  @override
  CollectionReference<TaskModel> get ref => FirebaseFirestore.instance
      .collection(FirestoreCollection.tasks)
      .withConverter<TaskModel>(
        fromFirestore: (snapshot, _) => TaskModel.fromJson(
          snapshot.data()!..['id'] = snapshot.id,
        ),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<void> createTask(TaskModel task, {String? documentId}) async {
    log.i('task"$task"');
    if (documentId.isNullOrEmpty) documentId = getNewDocId();
    try {
      await ref.doc(documentId).set(task, SetOptions(merge: true));
    } catch (e) {
      log.e('Unable to create a task, $e');
      rethrow;
    }
  }

  Future<List<TaskModel>> getTaskByShiftType({
    required ShiftType shiftType,
  }) async {
    log.i('shiftType:$shiftType');
    final results =
        await ref.where('shiftType', isEqualTo: shiftType.name).get();
    final tasks = results.docs.map((tasks) => tasks.data()).toList();
    log.v('Tasks found for shift $shiftType.\nData:\n$tasks');
    return tasks;
  }

  Future<List<TaskModel>> getAllTasks({int limit = 99}) async {
    try {
      final results = await ref
          .limit(limit)
          .orderBy(
            'createdAt',
            descending: false,
          )
          .get();
      final tasks = results.docs.map((tasks) => tasks.data()).toList();
      log.v('Tasks found.\nData:\n$tasks');
      return tasks;
    } catch (e) {
      log.e('Unable to get  tasks, $e');
      rethrow;
    }
  }
}
