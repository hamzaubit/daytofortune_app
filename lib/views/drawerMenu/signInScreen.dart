import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/views/drawerMenu/signUpScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:daytofortune_app/widgets/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class signInScreen extends StatefulWidget {
  @override
  _signInScreenState createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController username_email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.cancel_outlined,
                      size: SizeConfig.blockSizeHorizontal! * 8,
                      color: Colors.blueGrey,
                    )),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Text(
              "Log In",
              style: GoogleFonts.poppins(
                  color: secondaryThemeColor,
                  fontSize: SizeConfig.blockSizeHorizontal! * 7.5),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email:",
                              style: GoogleFonts.poppins(
                                  color: secondaryThemeColor,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4.5))),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: SizeConfig.blockSizeVertical! * 7,
                          width: SizeConfig.blockSizeHorizontal! * 80,
                          child: TextFormField(
                            controller: username_email,
                            style: GoogleFonts.poppins(
                                color: primaryThemeColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.5),
                            cursorColor: primaryThemeColor,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: 'E-mail',
                                hintStyle: GoogleFonts.poppins(
                                    color: primaryThemeColor,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5),
                                prefixIcon: Icon(
                                  Icons.account_box_outlined,
                                  color: primaryThemeColor,
                                  size: SizeConfig.blockSizeHorizontal! * 5.5,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Password:",
                                style: GoogleFonts.poppins(
                                    color: secondaryThemeColor,
                                    fontSize: SizeConfig.blockSizeHorizontal! *
                                        4.5))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: SizeConfig.blockSizeVertical! * 7,
                          width: SizeConfig.blockSizeHorizontal! * 80,
                          child: TextFormField(
                            controller: password,
                            style: GoogleFonts.poppins(
                                color: primaryThemeColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.5),
                            cursorColor: primaryThemeColor,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: textColor, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: 'Password',
                                hintStyle: GoogleFonts.poppins(
                                    color: primaryThemeColor,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: primaryThemeColor,
                                  size: SizeConfig.blockSizeHorizontal! * 5.5,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (username_email.text.isEmpty ||
                          password.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Expanded(
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: secondaryThemeColor, width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                backgroundColor: Color(0xff021524),
                                title: Text(
                                  'Warning!',
                                  style: GoogleFonts.poppins(
                                      color: secondaryThemeColor,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.5),
                                ),
                                content: Text('Enter your Email or Password',
                                    style: GoogleFonts.poppins(
                                        color: secondaryThemeColor,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.0)),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK',
                                        style: GoogleFonts.poppins(
                                            color: secondaryThemeColor,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.0)),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        signIn(username_email.text, password.text);
                        username_email.clear();
                        password.clear();
                        final FirebaseAuth? auth = FirebaseAuth.instance;
                        final User? user = auth!.currentUser;
                        final uid = user!.uid;
                        print("User ID : ${uid}");
                        print("User Name ${user!.displayName.toString()}");
                        print("User Email ${user!.email.toString()}");
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Success"),
                              content: new Text(
                                  "Welcome, " + username_email.text.toString()),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                        height: SizeConfig.blockSizeVertical! * 6,
                        width: SizeConfig.blockSizeHorizontal! * 40,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2.5,
                  ),
                  /*FlatButton(
                    onPressed: (){
                      signOut();
                    },
                    color: Colors.red,
                    child: Text("Sign Out"),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                            color: secondaryThemeColor,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.3),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUpScreen()));
                          },
                          child: Text(
                            " Sign Up here!",
                            style: GoogleFonts.poppins(
                                color: secondaryThemeColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.3),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await signInWithGoogle();
                      final user = FirebaseAuth.instance.currentUser;
                      print("User Name ${user!.displayName.toString()}");
                      print("User Email ${user.email.toString()}");
                      print("User ID : ${user.uid}");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Success"),
                            content: new Text(
                                "Welcome, " + user.displayName.toString()),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                      /*signInWithGoogle().then((UserCredential value) {
                        final displayName = value.user!.displayName;
                        print("My Name : ${displayName}");
                      });*/
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/googleLogo.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                          Text(
                            "Sign In with Google",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  GestureDetector(
                    onTap: () async {
                      signOut();
                      await signInWithFacebook();
                      final user = FirebaseAuth.instance.currentUser;
                      print("User Name ${user!.displayName.toString()}");
                      print("User Email ${user!.email.toString()}");
                      print("User ID : ${user.uid}");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Success"),
                            content: new Text(
                                "Welcome, " + user.displayName.toString()),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/fb.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                          Text(
                            "Sign In with Facebook",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                    child: Text(
                      "By signing up, you'll have access to hundreds of exclusive quotes, unique backgrounds , and can view unlimited media files.",
                      style: GoogleFonts.poppins(
                          color: secondaryThemeColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    ),
                  ),
                  Text(
                    "No thanks, continue as guest.",
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
