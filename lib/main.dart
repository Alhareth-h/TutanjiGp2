import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp2/presentation/bloc/main/main_bloc.dart';
import 'package:gp2/presentation/screens/welcome_screen/welcom_view.dart';
import 'package:gp2/repository/login_repo.dart';
import 'package:gp2/repository/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context)=>LoginRepository()),
        RepositoryProvider(create: (context)=>RegisterRepository())
      ],
      child: BlocProvider(
        create: (BuildContext context) {
          return MainBloc();
        },
        child: const MaterialApp(
          home: WelcomeView(),
        ),
      ),
    );
  }

}

