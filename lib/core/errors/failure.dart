import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String msg;

  Failure(this.msg);
}

class AuthFailure extends Failure {
  AuthFailure(super.msg);
  factory AuthFailure.fromFirebaseAuthError(FirebaseAuthException e) {
    if (e.code == "email-already-in-use") {
      return AuthFailure("The email entered is already in use");
    } else if (e.code == "invalid-email") {
      return AuthFailure("Email Adress Is Not Valid");
    } else if (e.code == "operation-not-allowed") {
      return AuthFailure(
          "Please Contact Us To Fix This Issue mhymwr847@gmail.com");
    } else if (e.code == "weak-password") {
      return AuthFailure("Password Is Not Strong Enough");
    } else if (e.code == "wrong-password") {
      return AuthFailure("Wrong Password");
    } else if (e.code == "user-disabled") {
      return AuthFailure(
          "This Error Thrown if the user corresponding to the given email has been disabled");
    } else if (e.code == "user-not-found") {
      return AuthFailure("User Not Found !");
    } else {
      return AuthFailure("Oops.. SomeThing Wen't Wrong");
    }
  }
}

class CloudFireStoreFailure extends Failure {
  CloudFireStoreFailure(super.msg);
}
