import 'package:anotei/app/modules/login/presenter/login_page.dart';
import 'package:anotei/app/modules/register/presenter/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => LoginPage());
    r.child('/details', child: (_) => RegisterPage());
  }
}
