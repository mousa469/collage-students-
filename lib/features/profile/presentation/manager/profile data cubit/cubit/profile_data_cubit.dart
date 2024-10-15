import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:students_collage/core/utils/service_locator.dart';
import 'package:students_collage/features/profile/data/repos/profile_repo_impelementation.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());

  fetchUserData({required String email}) async {
    emit(ProfileDataloading());
    var result = await getIt
        .get<ProfileRepoImpelementation>()
        .fetchUserDataFromFirestore(email: email);

    result.fold((failure) {
      emit(ProfileDataFailure(errMessage: failure.errMessage));
    }, (email) {
      emit(ProfileDataSuccess(userData: email));
    });
  }
}
