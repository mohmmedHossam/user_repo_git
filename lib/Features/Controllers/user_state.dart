part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel userModel;
  UserSuccess({required this.userModel});
}

class UserNotFound extends UserState {}

class UserFailure extends UserState {}
