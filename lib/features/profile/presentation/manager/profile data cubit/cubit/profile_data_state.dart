part of 'profile_data_cubit.dart';

@immutable
sealed class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class ProfileDataSuccess extends ProfileDataState {
  final  List<String> userData;

  ProfileDataSuccess({required this.userData});
}

final class ProfileDataFailure extends ProfileDataState {
  final String errMessage;

  ProfileDataFailure({required this.errMessage});
}

final class ProfileDataloading extends ProfileDataState {}
