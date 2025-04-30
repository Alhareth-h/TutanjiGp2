import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp2/presentation/bloc/main/main_bloc.dart';
import 'package:gp2/presentation/bloc/register/register_bloc.dart';
import 'package:gp2/presentation/screens/register_screen/register_content.dart';

import '../../../repository/register.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegularRegisterBloc(
          context.read<RegisterRepository>(), context.read<MainBloc>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          centerTitle: true,
        ),
        body: const RegisterContent(),
      ),
    );
  }
}
