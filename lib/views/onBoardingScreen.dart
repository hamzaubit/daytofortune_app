import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

import 'allSetScreen.dart';

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff050A30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical! * 40,),
          Center(child: Text("Believe you\ncan and you're\nhalfway there.",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 8.5,color: Colors.white),)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical! * 15,),
                Text("─THEODORE ROOSEVELT─",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 6,color: secondaryThemeColor,),),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => allSetScreen()));
            },
            child: Container(
              height: SizeConfig.blockSizeVertical! * 8,
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: secondaryThemeColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Let's Get Started!",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 4,color: Colors.black),),
                  Icon(Icons.arrow_forward,size: SizeConfig.blockSizeHorizontal! * 4,color: Colors.grey,),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}