import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class AuthException extends Failure {
  const AuthException({required super.errMessage});

  factory AuthException.fromFirebaseAuth(
      FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case 'weak-password':
        return const AuthException(
            errMessage: 'The password provided is too weak.');

      case 'email-already-in-use':
        return const AuthException(
            errMessage: 'The account already exists for that email.');

      case 'user-not-found':
        return const AuthException(errMessage: 'No user found for that email.');

      case 'wrong-password':
        return const AuthException(
            errMessage: 'Wrong password provided for that user.');

      default:
        return const AuthException(errMessage: "Invalid email or password ");
    }
  }
}

class SavingExceptions extends Failure {
  SavingExceptions({required super.errMessage});

  factory SavingExceptions.fromFirestoreException(FirebaseException firebaseException) {
    return SavingExceptions(errMessage:  firebaseException.message!);
  }
}
