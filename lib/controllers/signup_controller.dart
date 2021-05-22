import 'package:chat_app/common/config.dart';
import 'package:chat_app/common/firebase_auth.dart';
import 'package:chat_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SignupController extends ControllerMVC {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isLoading = false;

  signUp() async {
    try {
      setState(() {
        isLoading = true;
      });
      final User user = await FirebaseAuthService()
          .createUserWithEmailAndPassword(
              emailController.text, passwordController.text);
      if (user != null) {
        navigatorKey.currentState.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Home(
                user: user,
              ),
            ),
            (_) => false);
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      setState(() {
        isLoading = false;
      });
    }
  }
}
//  Navigator.of(context).pushNamed(AppRoutes.menu);
