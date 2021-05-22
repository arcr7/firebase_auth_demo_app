import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FirebaseAuthService {
  signInWithEmailAndPassword(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  createUserWithEmailAndPassword(String email, String password) async {
    return (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
  }
}
