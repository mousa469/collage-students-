import 'package:bloc/bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:students_collage/features/profile/data/repos/profile_repo_impelementation.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataInitial());

  final List<String> titles = [
    "name",
    "address",
    "unviersity",
    "phone number",
    "father phone number"
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.user,
    Icons.home,
    Icons.account_balance,
    Icons.phone,
    Icons.phone,
  ];

  List<String> userData = [];

  fetchUserData({required String email}) async {
    emit(ProfileDataloading());
    var result = await getIt
        .get<ProfileRepoImpelementation>()
        .fetchUserDataFromFirestore(email: email);

    result.fold((failure) {
      emit(ProfileDataFailure(errMessage: failure.errMessage));
    }, (userListOfData) {
     

      emit(ProfileDataSuccess(userData: userListOfData));
    });
  }
}
