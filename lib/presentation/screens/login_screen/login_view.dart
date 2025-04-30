import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp2/presentation/bloc/login/login_bloc.dart';
import 'package:gp2/presentation/bloc/main/main_bloc.dart';
import 'package:gp2/presentation/screens/login_screen/login_content.dart';
import 'package:gp2/repository/login_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(context.read<LoginRepository>(), context.read<MainBloc>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
          centerTitle: true,
        ),
        body: LoginContent(),
      ),
    );
  }
}
