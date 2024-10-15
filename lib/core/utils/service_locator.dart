import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:students_collage/features/authentication/data/repos/auth_repo/authentication_repo_impl.dart';
import 'package:students_collage/features/authentication/data/repos/save_user_info_repo/add_student_info_repo_impl.dart';
import 'package:students_collage/features/profile/data/repos/profile_repo_impelementation.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<AuthenticationRepoImpl>(
   AuthenticationRepoImpl(addStudentInfoRepoImpl: AddStudentInfoRepoImpl())
   );


 getIt.registerSingleton<CollectionReference>(
    FirebaseFirestore.instance.collection('users'),
  );

 getIt.registerSingleton<ProfileRepoImpelementation>(
    ProfileRepoImpelementation()
  );

}