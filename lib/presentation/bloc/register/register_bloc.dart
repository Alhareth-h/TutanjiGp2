import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gp2/presentation/bloc/main/main_bloc.dart';
import 'package:gp2/repository/register.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegularRegisterBloc extends Bloc<RegularRegisterEvent, RegularRegisterState> {
  RegularRegisterBloc(this.registerRepository, this.mainBloc)
      : super(RegularRegisterInitial()) {
    on<RegisterEmailAndPasswordEvent>(_onRegisterEmailAndPasswordEvent);
    on<RegisterShowPasswordEvent>(_onRegisterShowPassword);
    on<RegisterGoogleEvent>(_onRegisterGoogleEvent);
  }

  RegisterRepository registerRepository;

  bool hiddenPassword = true;
  bool isAccept=false;
  MainBloc mainBloc;
  final formKeySignupUser = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController=TextEditingController();



  void _onRegisterEmailAndPasswordEvent(
      RegisterEmailAndPasswordEvent event,
      Emitter emit,
      ) async {
    emit(RegisterStartProcessLoadingState());
    try {
      MainBloc.regularUserInfoModel =
       await registerRepository.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
      );

      emit(RegisterStartProcessSuccessState());
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(RegisterStartProcessFailState(error:e.toString()));
    }
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }
  void _onRegisterShowPassword(
      RegisterShowPasswordEvent event,
      Emitter emit,
      ) async {
    hiddenPassword = !hiddenPassword;
    print(hiddenPassword.toString());
    emit(RegisterShowPasswordState());
  }

  void _onRegisterGoogleEvent(
      RegisterGoogleEvent event,
      Emitter emit,
      ) async {
    emit(RegisterStartGoogleProcessLoadingState());
    try {
      MainBloc.regularUserInfoModel =
      await registerRepository.signInWithGoogle(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
      );

      emit(RegisterStartGoogleProcessSuccessState());
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(RegisterStartGoogleProcessFailState(error:e.toString()));
    }
  }
}
