import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_chat_app/model/user.dart';
import 'package:my_chat_app/screen/chat_screen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //var _chatUser = ChatUser();

  ChatUser? _userFromFirebaseUser(User firebaseUser) {
    return firebaseUser != null ? ChatUser(uid: firebaseUser.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn? _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? _googleSignAccount =
        await _googleSignIn!.signIn();

    final GoogleSignInAuthentication? _googleAuth =
        await _googleSignAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: _googleAuth!.idToken,
      accessToken: _googleAuth.accessToken,
    );

    UserCredential result = await _auth.signInWithCredential(credential);
    User? firebaseUserDetail = result.user;

    if (result == null) {
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    }
  }
}
