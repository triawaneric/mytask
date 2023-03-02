import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytask/data/model/task_model.dart';

class FireStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference todo = FirebaseFirestore.instance.collection('data');
  Future<void> addTodo({
    title,
    due_date,
    color,
    status,
    lastIndex,
    uid,
    creator}) async {
    // await todo.doc('$uid').set(
    //   {
    //     'todos': FieldValue.arrayUnion(
    //         [KTask(
    //             title: title,
    //             due_date: due_date,
    //             color: color,
    //             status: status,
    //             lastIndex: lastIndex,
    //             uid:uid,
    //             creator: creator
    //            )])
    //   },
    //   SetOptions(merge: true),
    // );
  }

  Future<void> updateTodo({newArr, uid}) async {
    await todo.doc('$uid').set(
      {'todos': newArr},
    );
  }

  Future<void> removeTodo({isComplete,
    task,
    startDate,
    endDate,
    startTime,
    endTime,
    color,
    category,
    uid,
    creator}) async {
    // await todo.doc('$uid').update(
    //   {
    //     'todos': FieldValue.arrayRemove(
    //         [TaskModel(
    //             isComplete: isComplete,
    //             task: task,
    //             startDate: startDate,
    //             endDate: endDate,
    //             startTime: startTime,
    //             endTime: endTime,
    //             color: color,
    //             category: category,
    //             creator: creator).toMap()])
    //   },
    // );
  }

  Stream<QuerySnapshot> getTodoStream() {
    return todo.snapshots();
  }
}
