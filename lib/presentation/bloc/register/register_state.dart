part of 'register_bloc.dart';

@immutable

sealed class RegularRegisterState {}

final class RegularRegisterInitial extends RegularRegisterState {}

class RegisterStartProcessLoadingState extends RegularRegisterState {}
class RegisterStartProcessSuccessState extends RegularRegisterState {}
class RegisterStartProcessFailState extends RegularRegisterState {
  final String error;
  RegisterStartProcessFailState({required this.error});
}

class RegisterStartGoogleProcessLoadingState extends RegularRegisterState {}
class RegisterStartGoogleProcessSuccessState extends RegularRegisterState {}
class RegisterStartGoogleProcessFailState extends RegularRegisterState {
  final String error;
  RegisterStartGoogleProcessFailState({required this.error});
}
///================================================
class RegisterUploadImageLoadingState extends RegularRegisterState {}
class RegisterUploadImageSuccessState extends RegularRegisterState {}
class RegisterUploadImageFailState extends RegularRegisterState {}
class RegisterLoadingState extends RegularRegisterState {}
class RegisterShowPasswordState extends RegularRegisterState{}

