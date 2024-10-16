import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/core/utils/service_locator.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpelementation implements ProfileRepo {
  @override
  Future<Either<Failure, List<String>>> fetchUserDataFromFirestore(
      {required String email}) async {
    try {
      QuerySnapshot querySnapshot = await getIt
          .get<CollectionReference>()
          .where("email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

       

        return right( StudentModel.convertReceivedMapToList(data: userData));
      } else {
        return left(const Failure(
            errMessage: "No user found with the provided email."));
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(
            fetchingDataFromFirestoreEcxeption.fromFirestoreException(e));
      }

      return Left(Failure(errMessage: e.toString()));
    }
  }
}
