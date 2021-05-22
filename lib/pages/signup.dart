import 'package:chat_app/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends StateMVC<Signup> {
  SignupController _con;

  _SignupState() : super(SignupController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
      ),
      body: _con.isLoading
          ? CircularProgressIndicator()
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
                    await _con.signUp();
                  },
                  child: Text('Singup'),
                )
              ],
            ),
    );
  }
}
