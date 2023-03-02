import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return userCredential.user?.uid;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future signIn({email, pass}) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    return userCredential.user;
  }

  getCurrentUser() {
    try {
      final userCredential = _firebaseAuth.currentUser?.toString();
      return userCredential;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future registerWithEmail({email, pass}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return userCredential.user;
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream userStream() {
    return _firebaseAuth.userChanges().cast();
  }
}