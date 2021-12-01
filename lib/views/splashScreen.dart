import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  String? stripeKey;
  var isPremium;
  var expiryDate;
  var validity;
  var date = new DateTime.fromMicrosecondsSinceEpoch(1643322154);
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    validity = from.difference(to).inDays;
    print("Difference : ${validity}");
    return (to.difference(from).inDays);
  }

  //the birthday's date
  final birthday = DateTime(2021, 12, 28);
  final date2 = DateTime.now();

  isUserPremium() {
    if (FirebaseAuth.instance.currentUser == null) {
      print('Not logged in');
      setState(() {
        isPremium = false;
      });
    } else {
//  fetch user data
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        print('User');
        setState(() {
          isPremium = (value.data()?['isPremium']);
          expiryDate = (value.data()?['expiryDate']);
          print("Expiry Date : ${expiryDate}");

        });
      });
    }
  }

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

  checkPremiumExpiry(){
    if(validity > 365){
      FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).update({
        'isPremium' : false,
        'expiryDate' : '',
      });
    }
    else{
      return "Your Premium is not expire";
    }
  }

  @override
  void initState() {
    gettingStrpeKey();
    isUserPremium();
    var date = DateTime.fromMillisecondsSinceEpoch(1643322154 * 1000);
    print("AAAAAAA ${date}");
    daysBetween(date, date2);
    checkPremiumExpiry();
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
