import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_model.dart';

part 'data_freezed.dart';

@freezed
class KData with _$KData {
  const factory KData({
    required int from,
    required KTask task,
  }) = _KData;
}