import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  String? stripeKey;

  gettingStrpeKey() async {
    await FirebaseFirestore.instance
        .collection('imp_Key')
        .doc('afVRxPxlAqLjiHuDGu56')
        .get()
        .then((value) {
      print('Getting Key');
      stripeKey = (value.data()?['Stripe']);
      Stripe.publishableKey = stripeKey!;
    });
  }

  @override
  void initState() {
    gettingStrpeKey();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical! * 25,
              width: SizeConfig.blockSizeHorizontal! * 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png',),fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3.5,),
            Text(
              "Day To Fortune",
              style: GoogleFonts.poppins(
                  color: secondaryThemeColor,
                  fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
            ),
          ],
        ),
      ),
    );
  }
}