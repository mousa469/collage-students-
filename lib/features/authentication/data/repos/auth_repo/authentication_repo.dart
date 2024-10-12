import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, String>> registerNewUser({ required StudentModel studentModel , required String password});
  Future<Either<Failure, String>> signInUser(
      {required String email, required String password});
}
