part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
//==================[Login Event]====================
class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}


class LoginFailState extends LoginState {
  final String error;

  LoginFailState({required this.error});
}
//===================[Show Password]==================
class LoginShowPasswordSuccessState extends LoginState {}
//============[Reset Password]======================
class RestUserPasswordLoadingState extends LoginState {}

class RestUserPasswordLSuccessState extends LoginState {}

class RestUserPasswordFailState extends LoginState {}
