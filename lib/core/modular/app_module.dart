import 'package:anotei/app/modules/login/presenter/login_page.dart';
import 'package:anotei/app/modules/register/presenter/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app/modules/home/presenter/home_page.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => HomePage());
    r.child('/register', child: (_) => RegisterPage());
    r.child('/home', child: (_) => HomePage());
  }
}
