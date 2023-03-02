import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends HydratedBloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(language: "de")) {
    on<LanguageChangeRequested>(((event, emit) async {
      emit(LanguageState(language: event.language));
      print("object"+event.language.toString());
    }));


    print("object"+"event.language.toString()");
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) =>
      LanguageState(language: json['language']);

  @override
  Map<String, String> toJson(LanguageState state) =>
      {'language': state.language};
}