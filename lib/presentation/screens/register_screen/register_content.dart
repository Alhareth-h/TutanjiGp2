import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp2/presentation/bloc/register/register_bloc.dart';
import 'package:gp2/presentation/screens/home_screen/home_view.dart';
import 'package:gp2/presentation/screens/login_screen/login_view.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegularRegisterBloc>();
    var state = context.watch<RegularRegisterBloc>();
    return Form(
      key: bloc.formKeySignupUser,
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/img.png',
              height: 200,
            ),
            Center(
                child: Text(
                  "Fill your information below or register with your social account.",
                  style: TextStyle(color: Colors.grey),
                )),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter Your Name';
                } else
                  null;
              },
              controller: bloc.nameController,
              decoration: InputDecoration(
                  label: Text("Name"),
                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter Your Email';
                } else
                  null;
              },
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
              height: 15,
            ),
            BlocBuilder<RegularRegisterBloc, RegularRegisterState>(
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
                          bloc.add(RegisterShowPasswordEvent());
                        },
                        icon: Icon(
                            bloc.hiddenPassword ? Icons.visibility : Icons
                                .visibility_off),
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
              height: 15,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter Your Phone';
                } else
                  null;
              },
              controller: bloc.phoneController,
              decoration: InputDecoration(
                  label: Text("Phone Number"),
                  hintText: "+962 | 7*********",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10))),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text("Agree with "),
                    GestureDetector(
                      child: Text(
                        "Terms & Condition",
                        style: TextStyle(color: Colors.pink),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<RegularRegisterBloc, RegularRegisterState>(
                listener: (context, state) {
                  if (state is RegisterStartProcessSuccessState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                    bloc.clearController();
                  }
                },
                builder: (context, state) {
                  return state is RegisterStartProcessLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: () {
                      bloc.add(RegisterEmailAndPasswordEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      // Button background color
                      foregroundColor: Colors.white,
                      // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 101, vertical: 15),
                      textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w100),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: Text("Sign Up"),
                  );
                },
              ),
            ),
            Column(
              children: [
                Text(
                  "Or sign up with",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    BlocBuilder<RegularRegisterBloc, RegularRegisterState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              bloc.add(RegisterGoogleEvent());
                            },
                            icon: Icon(Icons.g_mobiledata_sharp, size: 60,));
                      },
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account!"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.pink),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
