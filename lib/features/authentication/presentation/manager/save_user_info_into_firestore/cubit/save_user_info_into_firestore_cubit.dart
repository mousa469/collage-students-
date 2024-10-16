import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo_impl.dart';

part 'save_user_info_into_firestore_state.dart';

class SaveUserInfoIntoFirestoreCubit
    extends Cubit<SaveUserInfoIntoFirestoreState> {
  SaveUserInfoIntoFirestoreCubit() : super(SaveUserInfoIntoFirestoreInitial());

  AddStudentInfoRepoImpl addStudentInfoRepoImpl = AddStudentInfoRepoImpl();

void   saveUserInfoIntoFirestore({required StudentModel studentModel}) async {
    emit(SaveUserInfoIntoFirestoreloading());
    var result = await addStudentInfoRepoImpl.addStudentInfoToFireStore(
        studentModel: studentModel);

    result.fold((failure) {
      emit(SaveUserInfoIntoFirestoreFailure(errMessage: failure.errMessage));
    }, (isSaved) {
      emit(SaveUserInfoIntoFirestoreSuccess());
    });
  }
}
