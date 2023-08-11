import 'package:anotei/app/components/button_widget.dart';
import 'package:anotei/app/components/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late LoginController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: Color(0xFFFFCEFE),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.task_alt,
                size: 100,
                color: Color(0xFFD9ACF5),
              ),
              const SizedBox(height: 20),
              Text(
                'Bem vindo ao Anotei\n =)',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70),
              TextFieldWidget(
                controller: _controller.emailEC,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: _controller.passwordEC,
                hintText: 'Senha',
                obscureText: true,
              ),
              const SizedBox(height: 35),
              ButtonWidget(
                onTap: () {},
                text: 'Entrar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
