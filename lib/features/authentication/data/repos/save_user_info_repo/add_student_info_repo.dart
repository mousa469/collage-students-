import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';

abstract class AddStudentInfoRepo {
  Future<Either<Failure, bool>> addStudentInfoToFireStore(
      {required StudentModel studentModel});
}
