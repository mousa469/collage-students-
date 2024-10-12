import 'package:get_it/get_it.dart';
import 'package:students_collage/features/authentication/data/repos/authentication_repo_impl.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo_impl.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<AuthenticationRepoImpl>(
   AuthenticationRepoImpl(addStudentInfoRepoImpl: AddStudentInfoRepoImpl())
  );
}