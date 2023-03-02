import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mytask/utils/services/shared_preferences.dart';

part 'theme_event.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeMode> {

  ThemeBloc() : super(ThemeMode.light);


    changeThame() {
      if (state == ThemeMode.light) {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.light);
      }
    }



  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      return (json['theme'] as String).toThemeMode;
    } catch (_) {
      throw UnimplementedError();
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {'theme': state.toString()};
}

extension ThemeModeExtension on String {
  ThemeMode get toThemeMode =>
      this == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light;
}