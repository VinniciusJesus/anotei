import 'package:anotei/app/modules/register/domain/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/firebase_register_with_email/firebase_register_with_email_usecase_imp.dart';

class RegisterController extends ChangeNotifier {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  Future<void> register() async {
    final status = await FirebaseRegisterWithEmailUsecaseImp().call(
      registerModel: RegisterModel(
        email: emailEC.text,
        name: nameEC.text,
        password: passwordEC.text,
      ),
    );

    if (status == "200") {
      Modular.to.pushNamed(
        "/home",
      );
    }
  }
}
