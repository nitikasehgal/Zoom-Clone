import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/utils/snackbar.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  User get user => _auth.currentUser!;

  Future<bool> signInwithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleauth =
          await googleUser!.authentication;
      final credential = await GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firebase.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (E) {
      showSnackBar(context, E.message!);
      res = false;
    }
    return res;
  }

  void signOut() async {
    try {
      await GoogleSignIn().disconnect();
      await _auth.signOut();
    } catch (E) {
      print(E.toString());
    }
  }
}
