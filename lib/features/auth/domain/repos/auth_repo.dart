import 'package:dartz/dartz.dart';
import 'package:notes_app_with_fire_base/core/errors/failure.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthEntity>> singIn(AuthEntity user);
  Future<Either<Failure, AuthEntity>> singUp(AuthEntity user);
}
