import 'package:chat_app/views/signin.dart';
import 'package:chat_app/views/signup.dart';
import 'package:flutter/material.dart';

class AUthenticate extends StatefulWidget {
  @override
  _AUthenticateState createState() => _AUthenticateState();
}

class _AUthenticateState extends State<AUthenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
        toggle: toggleView,
      );
    } else {
      return SignUp(
        toggle: toggleView,
      );
    }
  }
}
