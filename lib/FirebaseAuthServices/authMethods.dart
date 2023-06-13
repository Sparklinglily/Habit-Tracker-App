

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_help/FirebaseAuthServices/widgets/showSnackBar.dart';
import 'package:habit_help/screens/homePage/homeScreen.dart';

import '../screens/checkEmail.dart';
import '../screens/loginPage.dart';

class FirebaseAuthMethods {
final FirebaseAuth _firebaseAuth;
FirebaseAuthMethods(this._firebaseAuth);


//get user
   User? _user;

   User get user => _firebaseAuth.currentUser!;

   //state persistence
  Stream<User?> get authState => _firebaseAuth.authStateChanges();

//signup
Future<void> signUpWithEmailAndPassword({
  required String name,
  required String email,
  required  String password,
  required BuildContext   context
}) async {
  try{
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password);

    await sendEmailVerification(context,"sent");
  }
  on FirebaseAuthException catch (e){
    showSnackBar(context, e.message!);
  }
}

//login

Future<void> signInWithEmailAndPassword({
  required String email,
  required String password,
  required BuildContext context

}) async {
  try{
    UserCredential userCred=  await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    _user = userCred.user;
    
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));

  }
  on FirebaseAuthException catch (e){
    showSnackBar(context, e.message!);

  }
}

//email verification

Future<void> sendEmailVerification(BuildContext context, String text) async{
  try{
    user.sendEmailVerification();
    showSnackBar(context, "Email Verification Sent");


  }
  on FirebaseAuthException catch (e){
    showSnackBar(context, e.message!);
  }

}
//passwordReset
  Future<void> passwordResetLink( String? email, context) async {
  //when reset password is clicked a shoe dialog tha shows a circular
    // progress indicator that cant be interrupted pops up, that what the barrier dismissible is about
    showDialog(context: context, barrierDismissible: false,
        builder: (context)=> const Center(child: CircularProgressIndicator(),));
    final _firebaseAuth = FirebaseAuth.instance;
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email!);


      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  CheckEmail(email: email)));

    }
    on FirebaseAuthException catch (e){
      showSnackBar(context, e.message!);
    }





  }


//signout

Future<void> signOut (BuildContext context) async{
  try{
    await _firebaseAuth.signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));

  }
      on FirebaseAuthException catch (e){
    showSnackBar(context, e.message!);

  }


}



}