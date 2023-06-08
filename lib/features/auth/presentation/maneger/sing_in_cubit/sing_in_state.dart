part of 'sing_in_cubit.dart';

@immutable
abstract class SingInState {}

class SingInInitial extends SingInState {}

class SingInLoading extends SingInState {}

class SingInSuccess extends SingInState {
  final AuthEntity user;

  SingInSuccess(this.user);
}

class SingInFailure extends SingInState {
  final String err;

  SingInFailure(this.err);
}
