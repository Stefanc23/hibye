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

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  DataBaseService db = DataBaseService();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Logged in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String fullName,
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

      return 'Signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
