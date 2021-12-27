import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onBoardingScreen.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  String? stripeKey;
  var isPremium;
  var expiryDate;
  var validity;
  bool? valDate;
  var homeScreenVariable;
  var dateNow = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //bool? freemiumVariable;

  isUserPremium() {
    if (FirebaseAuth.instance.currentUser == null) {
      print('Not logged in');
      setState(() {
        isPremium = false;
      });
    } else {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        print('User');
        setState(() {
          isPremium = (value.data()?['isPremium']);
          expiryDate = (value.data()?['expiryDate']);
          var myDate = DateTime.tryParse((value.data()?['expiryDate']));
          valDate = dateNow.isBefore(myDate!);
          print("Date Condition : ${valDate}");
          print("Expiry Date : ${expiryDate}");
          if(valDate == true){
            print("Your Premium is not expire");
          }
          else{
            var date = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
            var newDate = new DateTime(date.year, date.month, date.day);
            FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).update({
              'isPremium' : false,
              'expiryDate' : newDate.toString(),
            });
          }
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
      //freemiumVariable = (value.data()?['freemium']);
      Stripe.publishableKey = stripeKey!;
    });
  }


  goToHomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    homeScreenVariable = prefs.getString('HomeScreen');
    homeScreenVariable == null ? Navigator.push(context, MaterialPageRoute(builder: (context) => onBoardingScreen())) :
    Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
  }

  @override
  void initState() {
    gettingStrpeKey();
    isUserPremium();
    Timer(Duration(seconds: 3),(){
      goToHomeScreen();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: SizeConfig.blockSizeVertical! * 25,
                width: SizeConfig.blockSizeHorizontal! * 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png',),fit: BoxFit.cover
                  )
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3.5,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical! * 4.5,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 6,
                    width: SizeConfig.blockSizeHorizontal! * 30,
                    color: primaryThemeColor,
                    child: Center(
                      child: Text(
                        "DaytoFortune",
                        style: GoogleFonts.poppins(
                            color: secondaryThemeColor,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.3),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
