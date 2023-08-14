import 'package:anotei/app/modules/login/domain/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      Modular.to.pushNamed(
        "/home",
      );
    }
  }
}
