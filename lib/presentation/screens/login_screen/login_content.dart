import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp2/presentation/bloc/login/login_bloc.dart';
import 'package:gp2/presentation/screens/home_screen/home_view.dart';
import 'package:gp2/presentation/screens/register_screen/register_view.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();

    return Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/img.png',
            height: 200,
          ),
          SizedBox(
            height: 50,
          ),
          Form(
              key: bloc.formKeyUser,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Hi! Welcome back, You've been missed ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Email';
                      } else
                        null;
                    },
                    onChanged: (v) {},
                    controller: bloc.emailController,
                    decoration: InputDecoration(
                        label: Text("Email"),
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 5,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter Your Password';
                          } else
                            null;
                        },
                        controller: bloc.passwordController,
                        obscureText: bloc.hiddenPassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                bloc.add(LoginShowPassword());
                              },
                              icon: Icon(bloc.hiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            label: Text("Password"),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                    width: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeView()));
                          bloc.clearController();
                        }
                      },
                      builder: (context, state) {
                        return state is LoginLoadingState
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : ElevatedButton(
                          onPressed: () {
                            bloc.add(StartRegularLoginEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            // Button background color
                            foregroundColor: Colors.white,
                            // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 101, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Rounded corners
                            ),
                          ),
                          child: Text("Sign In"),
                        );
                      },
                    ),
                  ),
                ],
              )),
          Column(
            children: [
              const Text(
                "Or sign up with",
                style: TextStyle(color: Colors.grey),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple),
                  Icon(Icons.g_mobiledata_sharp),
                  Icon(Icons.facebook),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account!"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>RegisterView()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.pink),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
