part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final User? user;
  GetUserEvent({
    this.user,
  });
}