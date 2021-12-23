import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/views/drawerMenu/signUpScreen.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:daytofortune_app/widgets/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class signInScreen extends StatefulWidget {
  @override
  _signInScreenState createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {

  String formattedDate = DateFormat(' EEE d MMM yyyy').format(DateTime.now());

  TextEditingController username_email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  themeCheck(){
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
  }

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
              height: SizeConfig.blockSizeVertical! * 1,
            ),
            Text(
              "Log In",
              style: GoogleFonts.poppins(
                  color: secondaryThemeColor,
                  fontSize: SizeConfig.blockSizeHorizontal! * 7.5),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 1.5,
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
                    height: SizeConfig.blockSizeVertical! * 1.5,
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
                            keyboardType: TextInputType.text,
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
                    height: SizeConfig.blockSizeVertical! * 1.5,
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
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  GestureDetector(
                    onTap: (){
                      if(username_email.text.isEmpty){
                        final snackBar = SnackBar(
                          backgroundColor: secondaryThemeColor,
                          content: Text("Enter your email then tap on forgot password",style: TextStyle(color: primaryThemeColor),),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else{
                        resetBtn();
                      }
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                          color: secondaryThemeColor,
                          fontSize:
                          SizeConfig.blockSizeHorizontal! * 3.5),
                    ),
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
                      }
                      else {
                        signOut();
                        _submit();
                        setState(() {
                          isLoading = true;
                        });
                        //signIn(username_email.text.trim() , password.text,);
                        /*showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Success"),
                              content: new Text(
                                  "Welcome" + username_email.text.toString()),
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
                        );*/
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
                            isLoading ? CircularProgressIndicator(color: primaryThemeColor,) : Text(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signUpScreen()));
                        },
                        child: Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(
                              color: secondaryThemeColor,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4),
                        ),
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
                    height: SizeConfig.blockSizeVertical! * 2
                  ),
                  GestureDetector(
                    onTap: () async {
                      signOut();
                      await signInWithGoogle();
                      final user = FirebaseAuth.instance.currentUser;
                      print("User ID : ${user!.uid}");
                      themeCheck();
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(user.uid)
                          .set({'name': user.displayName.toString(), 'isPremium': false,'expiryDate' : '',});
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
                      print("User ID : ${user!.uid}");
                      themeCheck();
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(user.uid)
                          .set({'name': user.displayName.toString(), 'isPremium': false, 'expiryDate' : '',});
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
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                    },
                    child: Text(
                      "No thanks, continue as guest.",
                      style: GoogleFonts.poppins(
                          color: textColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _submit() async {
    final response = await signIn(username_email.text.trim(), password.text,);
    if (response['error'] == 1) {
      print(response['message']);
      final snackBar = SnackBar(
        backgroundColor: secondaryThemeColor,
        content: Text("Logged In Failed! Invalid Email or Password",style: TextStyle(color: primaryThemeColor),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });

    } else {
      print(response['message']);
      print("Successfully Registered");
      themeCheck();
      username_email.clear();
      password.clear();
      final snackBar = SnackBar(
        backgroundColor: secondaryThemeColor,
        content: Text("Logged In Successfully",style: TextStyle(color: primaryThemeColor),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading = false;
      });
    }
  }
  resetBtn() async {
    final response = await resetPassword(username_email.text.trim());
    if(response['error'] == 1){
      print(response['message']);
      final snackBar = SnackBar(
        backgroundColor: secondaryThemeColor,
        content: Text("No user found for that email.",style: TextStyle(color: primaryThemeColor),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      final snackBar = SnackBar(
        backgroundColor: secondaryThemeColor,
        content: Text("Request sent to the email",style: TextStyle(color: primaryThemeColor),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      username_email.clear();
    }
  }
}