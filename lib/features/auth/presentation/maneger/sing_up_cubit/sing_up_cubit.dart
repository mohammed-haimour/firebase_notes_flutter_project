import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit(this.userSingUp) : super(SingUpInitial());
  final AuthRepoImpl userSingUp;

  Future<void> singUp({required AuthEntity user}) async {
    emit(SingUpLaoding());
    var result = await userSingUp.singUp(user);
    result.fold((err) {
      emit(SingUpFailure(err.msg));
    }, (user) {
      emit(SingUpSuccess(user));
    });
  }
}
