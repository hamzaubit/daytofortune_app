import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'membershipScreen.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController password = new TextEditingController();
  static final RegExp nameRegExp = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  static final RegExp emailRegExp = RegExp(r'[^\@]+\@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+');
  static final RegExp passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text("Sign Up",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("1",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Account Details",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("────",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => membershipScreen()));
                        },
                        child: Container(
                          height: SizeConfig.blockSizeVertical! * 7,
                          width: SizeConfig.blockSizeHorizontal! * 14,
                          decoration: BoxDecoration(
                              color: secondaryThemeColor.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Center(child: Text("2",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                              fontWeight: FontWeight.w700))),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Membership",style: GoogleFonts.poppins(color: secondaryThemeColor.withOpacity(0.5),fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("────",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
                  ),
                  Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("3",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Confirm Account",style: GoogleFonts.poppins(color: secondaryThemeColor.withOpacity(0.5),fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      controller: firstName,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                                  fillColor: drawerColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor,width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor,width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor,width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                        validator: (value) => value!.isEmpty
                            ? 'Enter Your First Name'
                            : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Name')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      controller: lastName,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: drawerColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Last Name',
                        hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                        validator: (value) => value!.isEmpty
                            ? 'Enter Your Last Name'
                            : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Name')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      controller: email,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: drawerColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'E-mail Address',
                        hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                        validator: (value) => value!.isEmpty
                            ? 'Enter Your Email-Address'
                            : (emailRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Email-Address')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      controller: userName,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: drawerColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Username',
                        hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                        validator: (value) => value!.isEmpty
                            ? 'Enter Your Username'
                            : (nameRegExp.hasMatch(value)
                            ? null
                            : 'Enter a Valid Username')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      controller: password,
                      obscureText: !_passwordVisible,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: drawerColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _passwordVisible =! _passwordVisible;
                            });
                          },
                            child: _passwordVisible ? Icon(Icons.visibility,color: textColor,) : Icon(Icons.visibility_off,color: textColor,)),
                      ),
                        validator: (value) => value!.isEmpty
                            ? 'Enter Your Password'
                            : (passwordRegExp.hasMatch(value)
                            ? null
                            : 'Password length must be between 8 and 13\nand must contain 1 Special Character and 1 \nnumber and atleast 1 upper case')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      obscureText: !_confirmPasswordVisible,
                      style: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: drawerColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textColor,width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Confirm Password',
                        hintStyle: GoogleFonts.poppins(color: textColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _confirmPasswordVisible =! _confirmPasswordVisible;
                              });
                            },
                            child: _confirmPasswordVisible ? Icon(Icons.visibility,color: textColor,) : Icon(Icons.visibility_off,color: textColor,)),
                      ),
                        validator: (val){
                          if(val!.isEmpty)
                            return 'Confirm Your Password';
                          if(val != password.text)
                            return 'Not Match';
                          return null;
                        }
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
                  GestureDetector(
                    onTap: (){
                      if (_formKey.currentState!.validate()) {
                        signUp(email.text , password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => membershipScreen()));
                      }
                    },
                    child: Container(
                        height: SizeConfig.blockSizeVertical! * 6,
                        width: SizeConfig.blockSizeHorizontal! * 40,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Proceed",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 4,color: Colors.black),),
                          ],
                        )
                    ),
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
