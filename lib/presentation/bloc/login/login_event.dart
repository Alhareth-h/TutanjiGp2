part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class StartRegularLoginEvent extends LoginEvent {}

class LoginShowPassword extends LoginEvent {}

class RestUserPasswordEvent extends LoginEvent {}

final class MyLoginEvent extends LoginEvent {}
