part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final String email;

  AuthSuccess({required this.email});
}

class Authfailure extends AuthState {
  final String errMessage;

  Authfailure({required this.errMessage}); 
}

class Authloading extends AuthState {}
