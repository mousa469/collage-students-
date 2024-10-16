import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentInfoRepoImpl implements AddStudentInfoRepo {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  

  @override
  Future<Either<Failure, bool>> addStudentInfoToFireStore(
      {required StudentModel studentModel}) async {
    try {
      
      await users
          .add({
            kEmail: studentModel.email,
            kName: studentModel.name,
            kUniversity: studentModel.university,
            kPhoneNumber: studentModel.phoneNumber,
            kFatherPhoneNumber: studentModel.fatherPhoneNumber,
            kAddress: studentModel.address
          })
          .then((value) => print("User added successfully"))
          .catchError((onError) => print("faild to add user"));
      return right(true);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(SavingExceptions.fromFirestoreException(e));
      }

      return Left(SavingExceptions(errMessage: e.toString()));
    }
  }
}
