import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailValid = true;
  bool isPasswordValid = true;

  void validateFields() {
    isEmailValid =
        emailController.text.isNotEmpty && emailController.text.contains('@');
    isPasswordValid = passwordController.text.isNotEmpty;

    notifyListeners();
  }
}

