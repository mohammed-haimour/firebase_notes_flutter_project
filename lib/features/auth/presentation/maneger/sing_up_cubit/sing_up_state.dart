part of 'sing_up_cubit.dart';

@immutable
abstract class SingUpState {}

class SingUpInitial extends SingUpState {}

class SingUpLaoding extends SingUpState {}

class SingUpSuccess extends SingUpState {
  final AuthEntity user;

  SingUpSuccess(this.user);
}

class SingUpFailure extends SingUpState {
  final String err;

  SingUpFailure(this.err);
}
