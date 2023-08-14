import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/local_constants_keys.dart';
import '../../../../../core/features/save_local_user/save_local_user_usecase_imp.dart';
import '../../../model/login_model.dart';
import '../firebase_get_user/firebase_get_user_usecase_imp.dart';
import '../firebase_login_errors/firebase_login_errors_usecase_imp.dart';
import 'firebase_login_with_email_usecase.dart';

class FirebaseLoginWithEmailUsecaseImp
    implements FirebaseLoginWithEmailUsecase {
  final _firebaseInstance = FirebaseAuth.instance;

  @override
  Future<String?> call(LoginModel LoginModel) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final authentication = await _firebaseInstance.signInWithEmailAndPassword(
          email: LoginModel.email, password: LoginModel.password);

      await SaveLocalUserUsecaseImp().call(
        LoggedModel: await FirebaseGetUserUsecaseImp()
            .call(userID: authentication.user!.uid),
      );
      await prefs.setBool(LocalConstantsKeys.haveLogin, true);

      // Get.offAllNamed(Routes.TWITTER_TRENDS);
      return "200";
    } on FirebaseAuthException catch (e) {
      return FirebaseLoginErrorsUsecaseImp().call(errorCode: e.code);
    }
  }
}
