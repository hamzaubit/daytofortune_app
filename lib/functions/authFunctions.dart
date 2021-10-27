import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

signUp(String email , String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    print("Successfully Registered");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signIn(String email , String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    print("Successfully Logged In");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void signOut(){
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.signOut();
  print("Successfully Signed Out");
}

//Google SignIn
/*Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}*/

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleuser!.authentication;

  final
  GoogleAuthCredential? credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
  ) as GoogleAuthCredential?;
  //Fluttertoast.showToast(msg: "Account created");
  return await FirebaseAuth.instance.signInWithCredential(credential!);


}
