import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/local_constants_keys.dart';
import '../../../../core/features/save_local_user/save_local_user_usecase_imp.dart';
import '../../model/register_entity.dart';
import '../../../../login/domain/usecases/login/firebase_get_user/firebase_get_user_usecase_imp.dart';
import '../firebase_register_errors/firebase_register_error_usecase_imp.dart';
import 'firebase_register_with_email_usecase.dart';

class FirebaseRegisterWithEmailUsecaseImp
    implements FirebaseRegisterWithEmailUsecase {
  final _firebaseInstance = FirebaseAuth.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  @override
  Future<String> call({required RegisterModel RegisterModel}) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final addAccount = await _firebaseInstance.createUserWithEmailAndPassword(
        email: RegisterModel.email,
        password: RegisterModel.password,
      );

      await _firestoreInstance
          .collection("users")
          .doc(addAccount.user!.uid)
          .set({
        "id": addAccount.user!.uid,
        "name": RegisterModel.name,
        "email": RegisterModel.email,
      });

      final _loggedUser =
          await FirebaseGetUserUsecaseImp().call(userID: addAccount.user!.uid);

      await SaveLocalUserUsecaseImp().call(LoggedModel: _loggedUser);
      await prefs.setBool(LocalConstantsKeys.haveLogin, true);
      // Get.offAll(HomePage());

      // Get.offAllNamed(Routes.bottomBar);

      return "200";
    } on FirebaseAuthException catch (e) {
      return FirebaseRegisterErrorUsecaseImp().call(errorCode: e.code);
    }
  }
}
