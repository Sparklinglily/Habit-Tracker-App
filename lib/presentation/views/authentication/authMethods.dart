import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_help/presentation/views/authentication/widgets/showSnackBar.dart';
import 'package:habit_help/presentation/views/home/homeScreen.dart';

import 'checkEmail.dart';
import 'loginPage.dart';

class FirebaseAuthMethods {
  //auth instance
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthMethods(this._firebaseAuth);

//firestore instance
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//get user
  User? _user;

  User get user => _firebaseAuth.currentUser!;

  //state persistence
  Stream<User?> get authState => _firebaseAuth.authStateChanges();

//signup
  Future<void> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await sendEmailVerification(context, "sent");

      //after creating user,create a new document for the user in the users colection
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
// return userCredential;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      //throw Exception(e.message);
    }
  }

// login

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      //add  a new document for the user in users collection if it doesnt exist already
      // _fireStore.collection('user').doc(userCredential.user!.uid).set({
      //   'uid': userCredential.user!.uid,
      //   'email':email,
      //just incase thers a users whos doc hasnt been cretaed
      // },SetOptions(merge: true));
      // return userCredential;

      _user = userCred.user;

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      // throw Exception(e.message);
    }
  }

//email verification

  Future<void> sendEmailVerification(BuildContext context, String text) async {
    try {
      user.sendEmailVerification();
      showSnackBar(context, "Email Verification Sent");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//passwordReset
  Future<void> passwordResetLink(String? email, context) async {
    //when reset password is clicked a shoe dialog tha shows a circular
    // progress indicator that cant be interrupted pops up, that what the barrier dismissible is about
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    final _firebaseAuth = FirebaseAuth.instance;
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email!);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CheckEmail(email: email)));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//signout

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
