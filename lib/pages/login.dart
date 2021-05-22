import 'package:chat_app/common/config.dart';
import 'package:chat_app/controllers/login_controller.dart';
import 'package:chat_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  LoginController _con;

  _LoginState() : super(LoginController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _con.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _con.emailController,
                ),
                TextField(
                  controller: _con.passwordController,
                ),
                RaisedButton(
                  onPressed: () async {
                    await _con.signIn();
                  },
                  child: Text('SingIn'),
                ),
                GestureDetector(
                  onTap: () => navigatorKey.currentState
                      .push(MaterialPageRoute(builder: (context) => Signup())),
                  child: Text('SignUp'),
                )
              ],
            ),
    );
  }
}
