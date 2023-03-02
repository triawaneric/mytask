// class TaskModel {
//   bool isComplete;
//   String task;
//   String startDate;
//   String endDate;
//   String startTime;
//   String endTime;
//   String color;
//   String category;
//   String creator;
//   TaskModel({
//     required this.isComplete,
//     required this.task,
//     required this.startDate,
//     required this.endDate,
//     required this.startTime,
//     required this.endTime,
//     required this.color,
//     required this.category,
//     required this.creator,
//   });
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'isComplete': isComplete,
//       'task': task,
//       'startDate': startDate,
//       'endDate': endDate,
//       'startTime':startTime,
//       'endTime':endTime,
//       'color':color,
//       'category':category,
//       'creator': creator,
//     };
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

@freezed
class KTask with _$KTask {
  const factory KTask({
    required String title,
    required String due_date,
    required String color,
    required bool status,
    required int lastIndex


  }) = _KTask;
}