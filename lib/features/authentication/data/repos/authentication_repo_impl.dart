import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/auth_repo/authentication_repo.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo_impl.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  AuthenticationRepoImpl({required this.addStudentInfoRepoImpl});
  final FirebaseAuth _user = FirebaseAuth.instance;
  UserCredential? _userCredential;

  final AddStudentInfoRepoImpl addStudentInfoRepoImpl;

  @override
  Future<Either<Failure, String>> registerNewUser({required StudentModel studentModel, required String password}) async {
    try {
      _userCredential = await _user.createUserWithEmailAndPassword(
          email: studentModel.email ?? '' , password: password);

   

      addStudentInfoRepoImpl.addStudentInfoToFireStore(
          studentModel: studentModel);

      return Right(studentModel.email!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthException.fromFirebaseAuth(e));
      }

      return left(AuthException(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signInUser(
      {required String email, required String password}) async {
    try {
      _userCredential = await _user.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(email);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthException.fromFirebaseAuth(e));
      }

      return left(AuthException(errMessage: e.toString()));
    }
  }
}
