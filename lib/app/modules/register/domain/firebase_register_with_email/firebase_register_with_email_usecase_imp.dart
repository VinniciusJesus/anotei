import 'package:anotei/core/save_local_user/save_local_user_usecase_imp.dart';
import 'package:anotei/core/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login/domain/usecases/login/firebase_get_user/firebase_get_user_usecase_imp.dart';
import '../firebase_register_errors/firebase_register_error_usecase_imp.dart';
import '../model/register_model.dart';

class FirebaseRegisterWithEmailUsecaseImp {
  final _firebaseInstance = FirebaseAuth.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  Future<String> call({required RegisterModel registerModel}) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final addAccount = await _firebaseInstance.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );

      await _firestoreInstance
          .collection("users")
          .doc(addAccount.user!.uid)
          .set({
        "id": addAccount.user!.uid,
        "name": registerModel.name,
        "email": registerModel.email,
      });

      final _loggedUser =
          await FirebaseGetUserUsecaseImp().call(userID: addAccount.user!.uid);

      await SaveLocalUserUsecaseImp().call(loggedEntity: _loggedUser);
      await prefs.setBool(Strings.haveLogin, true);

      return "200";
    } on FirebaseAuthException catch (e) {
      return FirebaseRegisterErrorUsecaseImp().call(errorCode: e.code);
    }
  }
}
