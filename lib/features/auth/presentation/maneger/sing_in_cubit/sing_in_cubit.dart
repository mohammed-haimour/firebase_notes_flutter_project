import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';

part 'sing_in_state.dart';

class SingInCubit extends Cubit<SingInState> {
  SingInCubit({required this.userSingin}) : super(SingInInitial());
  final AuthRepoImpl userSingin;

  Future<void> singIn({required AuthEntity user}) async {
    emit(SingInLoading());
    var result = await userSingin.singIn(user);
    result.fold((err) {
      emit(SingInFailure(err.msg));
    }, (user) {
      emit(SingInSuccess(user));
    });
  }
}
