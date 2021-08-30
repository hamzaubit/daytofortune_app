import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final _formKey = GlobalKey<FormState>();

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
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("2",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
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
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        /*hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,*/
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(30))),
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        /*hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,*/
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Last Name',
                        hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        /*hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,*/
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'E-mail Address',
                        hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        /*hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,*/
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Username',
                        hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,right: 35,bottom: 20),
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        /*hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  fillColor: Colors.white,*/
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
