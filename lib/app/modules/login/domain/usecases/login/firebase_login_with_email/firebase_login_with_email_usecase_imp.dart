import 'package:anotei/core/save_local_user/save_local_user_usecase_imp.dart';
import 'package:anotei/core/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/login_model.dart';
import '../firebase_get_user/firebase_get_user_usecase_imp.dart';
import '../firebase_login_errors/firebase_login_errors_usecase_imp.dart';

class FirebaseLoginWithEmailUsecaseImp {
  final _firebaseInstance = FirebaseAuth.instance;

  
  Future<void> call(LoginModel loginModel) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final authentication = await _firebaseInstance.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);

      await SaveLocalUserUsecaseImp().call(
        loggedEntity: await FirebaseGetUserUsecaseImp()
            .call(userID: authentication.user!.uid),
      );
      await prefs.setBool(Strings.haveLogin, true);

      // Get.offAllNamed(Routes.TWITTER_TRENDS);
      return;
    } on FirebaseAuthException catch (e) {
      FirebaseLoginErrorsUsecaseImp().call(errorCode: e.code);
    }
  }
}
