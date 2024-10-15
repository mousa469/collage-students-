import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Map<String,dynamic>>> fetchUserDataFromFirestore({required String email});
}
