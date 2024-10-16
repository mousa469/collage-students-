part of 'save_user_info_into_firestore_cubit.dart';

@immutable
sealed class SaveUserInfoIntoFirestoreState {}

final class SaveUserInfoIntoFirestoreInitial
    extends SaveUserInfoIntoFirestoreState {}

final class SaveUserInfoIntoFirestoreSuccess
    extends SaveUserInfoIntoFirestoreState {}

final class SaveUserInfoIntoFirestoreFailure
    extends SaveUserInfoIntoFirestoreState {
  final String errMessage;

  SaveUserInfoIntoFirestoreFailure({required this.errMessage});
}

final class SaveUserInfoIntoFirestoreloading
    extends SaveUserInfoIntoFirestoreState {}
