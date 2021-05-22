import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Home extends StatefulWidget {
  final User user;
  Home({@required this.user});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends StateMVC<Home> {
  HomeController _con;
  _HomeState() : super(HomeController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Text('Home')
    );
  }
}
