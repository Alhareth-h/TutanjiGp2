part of 'register_bloc.dart';



@immutable
sealed class RegularRegisterEvent {}
class RegisterEmailAndPasswordEvent extends RegularRegisterEvent{}
class RegisterGoogleEvent extends RegularRegisterEvent{}

class UploadImage extends RegularRegisterEvent {}

class RegisterShowPasswordEvent extends RegularRegisterEvent {}

class AcceptTermsEvent extends RegularRegisterEvent{}
