import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hibye/db/database.dart';
// ignore: library_prefixes
import 'package:hibye/models/user.dart' as UserModel;
import 'package:hibye/screens/landing.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  DataBaseService db = DataBaseService();

  Future<String?> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      return 'Logged in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required BuildContext context,
      required String fullName,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel.User newUser = UserModel.User(
        id: _firebaseAuth.currentUser!.uid,
        fullName: fullName,
        email: email,
        password: password,
      );

      db.createUser(newUser);

      Navigator.of(context).pop();
      return 'Signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Landing()),
    );
  }
}
