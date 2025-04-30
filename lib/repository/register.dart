import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gp2/models/user_model.dart';


class RegisterRepository {

  //===============[Create Account]===============
  Future<RegularUserInfoModel> register({
    required String email,
    required String password,
    required String name,
    required String phone,
      }) async {
    try {
      print('youffff');
      var credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('testttt2');
      return await registerUserInfo(
        email: email,
        user: credential.user!,
        phone: phone,
        name: name,
        password: password

      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //==============[Save Data]====================
  Future<RegularUserInfoModel> registerUserInfo({
    required String email,
    required String phone,
    required User user,
    required String name,
    required String password,
  }) async {
    log('we enter to save info method');
    try {
      CollectionReference users =
      FirebaseFirestore.instance.collection("UserData");
    print('youseffffffffff');
      var userInfo = await users.add({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'uid': user.uid,
        'phone': phone,

        'password': password,
      });
      return RegularUserInfoModel.fromJson({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'password':password,
        'phone': phone,
        'uid': user.uid,
      }, userInfo.id);
    } on FirebaseException catch (e) {
      print('${e.message}============ test');
      throw Exception(e.message);
    }
  }

  //===============[Create Account by google]=============
  Future<RegularUserInfoModel?> signInWithGoogle({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return null; // user cancelled

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      return await registerUserInfo(
          email: email,
          user: userCredential.user!,
          phone: phone,
          name: name,
          password: password

      );
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }

}
