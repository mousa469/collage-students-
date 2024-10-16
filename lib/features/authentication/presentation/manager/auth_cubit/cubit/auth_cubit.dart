import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:students_collage/features/authentication/data/models/student_model.dart';
import 'package:students_collage/features/authentication/data/repos/auth_repo/authentication_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required  this.authenticationRepoImpl}) : super(AuthInitial());

  final AuthenticationRepoImpl authenticationRepoImpl;

  registerNewUser(
      {required String password, required String email }) async {
    emit(Authloading());
    var result = await authenticationRepoImpl.registerNewUser(
        password: password, email:  email );

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
