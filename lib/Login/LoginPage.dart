import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/HomePage/HomePage.dart';
import 'package:untitled6/Login/LoginViewModel.dart';
import 'package:untitled6/Widgets/Widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  _buildLoginHeadline(),
                  const SizedBox(height: 30),
                  _buildEmailTextField(),
                  const SizedBox(height: 20),
                  _buildPasswordTextField(),
                  const SizedBox(height: 10),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildForgetPasswordButton(context),
                      ],
                    ),
                  ),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginHeadline() {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Consumer<LoginViewModel>(
      builder: (context, model, child) => textFromField(
        email: 'Email',
        icon: Icons.email,
        inputType: TextInputType.emailAddress,
        password: false,
        controller: model.emailController,
        isValid: model.isEmailValid,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Consumer<LoginViewModel>(
      builder: (context, model, child) => textFromField(
        email: 'Password',
        icon: Icons.lock,
        inputType: TextInputType.text,
        password: true,
        controller: model.passwordController,
        isValid: model.isPasswordValid,
      ),
    );
  }

  Widget _buildLoginButton() {
    return Consumer<LoginViewModel>(
      builder: (context, model, child) => buttonBlackBottom(
        onPressed: () async {
          model.validateFields();
          if (model.isEmailValid && model.isPasswordValid) {
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: model.emailController.text,
                password: model.passwordController.text,
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            } catch (e) {
              // Handle login error here (display an error message, etc.)
              setState(() {
                _errorMessage = 'Incorrect email or password';
              });
              print('Login error: $e');
            }
          }
        },
        name: 'Login',
      ),
    );
  }

  Widget _buildForgetPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {

      },
      child: const Text(
        'Forget Password?',
        style: TextStyle(
          color: Color(0xFF121940),
        ),
      ),
    );
  }
}

