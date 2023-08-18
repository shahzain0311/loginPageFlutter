import 'package:flutter/material.dart';

TextStyle textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

// Fields
class textFromField extends StatelessWidget {
  final bool password;
  final String email;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool isValid;

  const textFromField({
    required this.email,
    required this.icon,
    required this.inputType,
    required this.password,
    required this.controller,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    print('field build');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)],
        ),
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 30.0,
          top: 0.0,
          bottom: 0.0,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: password,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: email,
            errorText: isValid ? null : 'Invalid $email',
            icon: Icon(
              icon,
              color: Colors.black38,
            ),
            labelStyle: const TextStyle(
              fontSize: 15.0,
              fontFamily: 'Sans',
              letterSpacing: 0.3,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}

// Button

class buttonBlackBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;

  const buttonBlackBottom({
    required this.onPressed,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF121940),
              Color(0xFF6E48AA),
            ],
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
