// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KTask {
  String get title => throw _privateConstructorUsedError;
  String get due_date => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  int get lastIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KTaskCopyWith<KTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KTaskCopyWith<$Res> {
  factory $KTaskCopyWith(KTask value, $Res Function(KTask) then) =
      _$KTaskCopyWithImpl<$Res, KTask>;
  @useResult
  $Res call(
      {String title,
      String due_date,
      String color,
      bool status,
      int lastIndex});
}

/// @nodoc
class _$KTaskCopyWithImpl<$Res, $Val extends KTask>
    implements $KTaskCopyWith<$Res> {
  _$KTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? due_date = null,
    Object? color = null,
    Object? status = null,
    Object? lastIndex = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      due_date: null == due_date
          ? _value.due_date
          : due_date // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      lastIndex: null == lastIndex
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KTaskCopyWith<$Res> implements $KTaskCopyWith<$Res> {
  factory _$$_KTaskCopyWith(_$_KTask value, $Res Function(_$_KTask) then) =
      __$$_KTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String due_date,
      String color,
      bool status,
      int lastIndex});
}

/// @nodoc
class __$$_KTaskCopyWithImpl<$Res> extends _$KTaskCopyWithImpl<$Res, _$_KTask>
    implements _$$_KTaskCopyWith<$Res> {
  __$$_KTaskCopyWithImpl(_$_KTask _value, $Res Function(_$_KTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? due_date = null,
    Object? color = null,
    Object? status = null,
    Object? lastIndex = null,
  }) {
    return _then(_$_KTask(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      due_date: null == due_date
          ? _value.due_date
          : due_date // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      lastIndex: null == lastIndex
          ? _value.lastIndex
          : lastIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_KTask implements _KTask {
  const _$_KTask(
      {required this.title,
      required this.due_date,
      required this.color,
      required this.status,
      required this.lastIndex});

  @override
  final String title;
  @override
  final String due_date;
  @override
  final String color;
  @override
  final bool status;
  @override
  final int lastIndex;

  @override
  String toString() {
    return 'KTask(title: $title, due_date: $due_date, color: $color, status: $status, lastIndex: $lastIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.due_date, due_date) ||
                other.due_date == due_date) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastIndex, lastIndex) ||
                other.lastIndex == lastIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, due_date, color, status, lastIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KTaskCopyWith<_$_KTask> get copyWith =>
      __$$_KTaskCopyWithImpl<_$_KTask>(this, _$identity);
}

abstract class _KTask implements KTask {
  const factory _KTask(
      {required final String title,
      required final String due_date,
      required final String color,
      required final bool status,
      required final int lastIndex}) = _$_KTask;

  @override
  String get title;
  @override
  String get due_date;
  @override
  String get color;
  @override
  bool get status;
  @override
  int get lastIndex;
  @override
  @JsonKey(ignore: true)
  _$$_KTaskCopyWith<_$_KTask> get copyWith =>
      throw _privateConstructorUsedError;
}
