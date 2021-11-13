import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

signUp(String email, String password) async {
  var response = {};

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({'email': email, 'isPremium': false}).then((value) {
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

signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Successfully Logged In");
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    print("My User Id Is : ${uid}");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}


checkLoggedIn()async{
  final user = await FirebaseAuth.instance.currentUser;
  if(user == null)
    return false;
  else
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
  //Fluttertoast.showToast(msg: "Account created");
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
