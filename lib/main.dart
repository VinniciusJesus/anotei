import 'package:anotei/app/modules/register/presenter/register_controller.dart';
import 'package:anotei/core/modular/app_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app/modules/login/presenter/login_controller.dart';
import 'app/modules/register/presenter/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp((MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => RegisterController()),
    ],
    child: ModularApp(module: AppModule(), child: App()),
  )));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aNotei',
      home: RegisterPage(),
    );
  }
}
