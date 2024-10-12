import 'package:dartz/dartz.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentInfoRepoImpl implements AddStudentInfoRepo {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  Future<Either<Failure, void>> addStudentInfoToFireStore(
      {required StudentModel studentModel}) async {
    try {
      
      await users
          .add({
            "email": studentModel.email,
            "name": studentModel.name,
            "university": studentModel.university,
            "phone number": studentModel.phoneNumber,
            "father phone number ": studentModel.fatherPhoneNumber,
            "address": studentModel.address
          })
          .then((value) => print("User added successfully"))
          .catchError((onError) => print("faild to add user"));
      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(SavingExceptions.fromFirestoreException(e));
      }

      return Left(SavingExceptions(errMessage: e.toString()));
    }
  }
}
