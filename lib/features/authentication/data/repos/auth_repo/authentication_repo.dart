import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, String>> registerNewUser({ required  String  email , required String password});
  Future<Either<Failure, String>> signInUser(
      {required String email, required String password});
}
