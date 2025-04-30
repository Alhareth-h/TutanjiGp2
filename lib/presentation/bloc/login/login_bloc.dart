import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp2/presentation/bloc/main/main_bloc.dart';
import 'package:gp2/repository/login_repo.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository, this.mainBloc) : super(LoginInitial()) {
    on<LoginShowPassword>(_onLoginShowPassword);
    on<StartRegularLoginEvent>(_onLoginRegularStartProcessEvent);
    on<RestUserPasswordEvent>(_onRestPasswordEvent);
    // on<LoginUsingGoogle>(_onLoginUsingGoogle);
  }

  LoginRepository loginRepository;
  MainBloc mainBloc;
  bool hiddenPassword = true;
  bool isChecked = false;

  // GoogleUserInfo? googleUserInfo;

  final formKeyUser = GlobalKey<FormState>();
  final resetFormKeyUser = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController restPasswordController = TextEditingController();

  void onLoginShowPassword(
      LoginShowPassword event,
      Emitter emit,
      ) async {
    hiddenPassword = !hiddenPassword;
    print(hiddenPassword.toString());
    emit(LoginShowPasswordSuccessState());
  }

//===================[Login Regular]===============
  void _onLoginRegularStartProcessEvent(
      StartRegularLoginEvent event,
      Emitter emit,
      ) async {
    emit(LoginLoadingState());
    try {
      MainBloc.regularUserInfoModel = await loginRepository.loginRegular(
          emailController.text, passwordController.text);
      log(MainBloc.regularUserInfoModel!.name!);



      emit(LoginSuccessState());
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      print('ERRROOOORRRR ${e.toString()}');
      emit(LoginFailState(error: e.toString()));
    }
  }




  //===================[Rest Password]==============
  Future<void> _onRestPasswordEvent(
      RestUserPasswordEvent event, Emitter emit) async {
    emit(RestUserPasswordLoadingState());
    try {
      await loginRepository.forgetPassword(restPasswordController.text);
      emit(RestUserPasswordLSuccessState());
    } on FirebaseException catch (e) {
      print('${e.message}============firebase');
      emit(RestUserPasswordFailState());
    } catch (e) {
      print('${e.toString()}==============catch');
      emit(RestUserPasswordFailState());
    }
  }

  void clearController() {
    passwordController.clear();
    emailController.clear();
    hiddenPassword = true;
  }



  void _onLoginShowPassword(
      LoginShowPassword event,
      Emitter emit,
      ) async {
    hiddenPassword = !hiddenPassword;
    print(hiddenPassword.toString());
    emit(LoginShowPasswordSuccessState());
  }
}
