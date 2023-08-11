import 'package:anotei/app/modules/login/presenter/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/modules/login/presenter/login_controller.dart';

void main() {
  runApp((MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginController()),
    ],
    child: const App(),
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
      home: LoginPage(),
    );
  }
}
