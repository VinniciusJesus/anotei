import 'package:anotei/app/modules/login/domain/model/login_model.dart';
import 'package:flutter/material.dart';

import '../domain/usecases/login/firebase_login_with_email/firebase_login_with_email_usecase_imp.dart';

class LoginController extends ChangeNotifier {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  Future<void> login() async {
    final status = await FirebaseLoginWithEmailUsecaseImp().call(LoginModel(
      email: emailEC.text,
      password: passwordEC.text,
    ));

    if (status == "200") {
      // Navigator.push(
      //   context,
      //   PageTransition(
      //       child: BottomPage(),
      //       type: PageTransitionType.rightToLeft,
      //       alignment: Alignment.center,
      //       duration: Duration(milliseconds: 500)),
      // );
    }
  }
}
