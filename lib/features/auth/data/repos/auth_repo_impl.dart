import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_with_fire_base/core/errors/failure.dart';
import 'package:notes_app_with_fire_base/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> singIn(AuthEntity user) async {
    try {
      return right(await authRemoteDataSource.singIn(user));
    } catch (e) {
      if (e is FirebaseAuthException)  {
        return left(AuthFailure.fromFirebaseAuthError(e));
      } else {
        return left(AuthFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> singUp(AuthEntity user) async {
    try {
      return right(await authRemoteDataSource.singUp(user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(AuthFailure.fromFirebaseAuthError(e));
      } else {
        return left(AuthFailure(e.toString()));
      }
    }
  }
}
