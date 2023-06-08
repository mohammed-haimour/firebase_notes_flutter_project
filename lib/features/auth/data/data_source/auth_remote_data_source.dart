import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app_with_fire_base/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRemoteDataSource {
  Future<AuthEntity> singIn(AuthEntity user);
  Future<AuthEntity> singUp(AuthEntity user);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthEntity> singIn(AuthEntity user) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.emailAdress, password: user.password);
    return user;
  }

  @override
  Future<AuthEntity> singUp(AuthEntity user) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.emailAdress,
      password: user.password,
    );
    return user;
  }
}
