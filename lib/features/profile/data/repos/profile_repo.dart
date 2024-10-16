import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, List<String>>> fetchUserDataFromFirestore({required String email});
}
