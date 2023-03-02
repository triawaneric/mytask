import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:mytask/data/model/user_model.dart';
import 'package:mytask/utils/helper/enums.dart';
import 'package:mytask/utils/services/auth_service.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthService authService;
  late StreamSubscription _streamSubscription;
  UserBloc({required this.authService}) : super(UserState()) {
    _streamSubscription = authService.userStream().listen((event) {
      add(GetUserEvent(user: event));
    });
    on<GetUserEvent>((event, emit) {
      UserModel user =
      UserModel(uid: event.user?.uid, email: event.user?.email);
      emit(state.copyWith(user: user));
    });

  }
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}