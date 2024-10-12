import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:students_collage/core/errors/failure.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/authentication_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required  this.authenticationRepoImpl}) : super(AuthInitial());

  final AuthenticationRepoImpl authenticationRepoImpl;

  registerNewUser(
      {required String password, required StudentModel studentModel}) async {
    emit(Authloading());
    var result = await authenticationRepoImpl.registerNewUser(
        password: password, studentModel: studentModel);

    result.fold((failure) {
      emit(Authfailure(errMessage: failure.errMessage));
    }, (email) {
      emit(AuthSuccess(email: email));
    });
  }

  signInUser({required String password, required String email}) async {
     emit(Authloading());
    var result =  await authenticationRepoImpl.signInUser(email: email, password: password);
    result.fold((failure) {
      emit(Authfailure(errMessage: failure.errMessage));
    }, (email) {
      emit(AuthSuccess(email: email));
    });


  }
}
