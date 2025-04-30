

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp2/models/user_model.dart';

class LoginRepository {
  //===================[Regular]====================
  Future<RegularUserInfoModel> loginRegular(
      String email, String password) async {
    try {
      print('$email==================hhhhhhhhh');
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getRegularInfo(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print('hte ddkdkdk ${e.message}');
      if (e.code == 'user-not-found') {
        throw Exception(e.message);
      } else if (e.code == 'wrong-password') {
        throw Exception(e.message);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<RegularUserInfoModel> getRegularInfo(String uid) async {
    try {
      QuerySnapshot<Map<String, dynamic>> user =
      await FirebaseFirestore.instance
          .collection('UserData')
          .where(
        "uid",
        isEqualTo: uid,
      )
          .get();
      print('user $user');
      print('user ${user.docs.first.id}');
      print('user ${user.docs.first.data()}');
      return RegularUserInfoModel.fromJson(
        user.docs.first.data(),
        user.docs.first.id,
      );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }



  Future<void> forgetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      print('${e.message}=============firebase exception');
    } catch (e) {
      print('${e.toString()}=================catch ');
    }
  }
}
