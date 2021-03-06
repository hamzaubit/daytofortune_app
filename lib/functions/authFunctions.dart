import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

signUp(String email, String password, String name) async {
  var response = {};

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({'email': email, 'isPremium': false,'expiryDate' : '',}).then((value) {
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection("myCustomTheme")
            .doc("1")
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .doc("1")
          ..set({
            "themeEnabled": false,
            "url": null,
          }).then((_) {
            print("success!");
          });
        response['error'] = 0;
        response['message'] = ("Successfully Registered");
      }).catchError((err) {
        response['error'] = 1;
        response['message'] = (err.toString());
      });
    }).catchError((err) {
      response['error'] = 1;
      response['message'] = (err.toString());
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      response['error'] = 1;
      response['message'] = ('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      response['error'] = 1;
      response['message'] = ('The account already exists for that email.');
    }
  } catch (e) {
    response['error'] = 1;
    response['message'] = (e.toString());
  }

  return response;
}

signIn(String email, String password,) async {

  var response = {};

  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Successfully Logged In");
    response['error'] = 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      response['error'] = 1;
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      response['error'] = 1;
      print('Wrong password provided for that user.');
    }
  }
  return response;
}

resetPassword(String email){

  var response = {};
  try{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    print("Successfully sent request to the email");
    response['error'] = 0;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      response['error'] = 1;
      print('No user found for that email.');
    }
  }
  return response;
}


checkLoggedIn()async{
  final user = await FirebaseAuth.instance.currentUser;
  if(user == null)
    return false;
  else
    print("My User ID : ${FirebaseAuth.instance.currentUser!.uid}");
    return true;
}

void signOut() {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.signOut();
  print("Successfully Signed Out");
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth =
      await googleuser!.authentication;

  final GoogleAuthCredential? credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken) as GoogleAuthCredential?;
  return await FirebaseAuth.instance.signInWithCredential(credential!);
}

Future<UserCredential> signInWithFacebook() async {
  final fb = FacebookLogin();
  final res = await fb.logIn(permissions: [
    FacebookPermission.publicProfile,
    FacebookPermission.email
  ]);
  switch (res.status) {
    case FacebookLoginStatus.success:
      break;
    case FacebookLoginStatus.cancel:
      print("The user canceled the login");
      break;
    case FacebookLoginStatus.error:
      print("There was an error");
      break;
  }
  final fbToken = res.accessToken;
  if (fbToken != null) {
    final FacebookAuthCredential credential =
        FacebookAuthProvider.credential(fbToken.token)
            as FacebookAuthCredential;
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    print(result.user!.displayName);
    return result;
  } else {
    print("there was an error");
    return Future.error("there was an error");
  }
}
