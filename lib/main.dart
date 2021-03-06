import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/views/onBoardingScreen.dart';
import 'package:daytofortune_app/views/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'functions/authFunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  checkLoggedIn();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
 /* SharedPreferences prefs = await SharedPreferences.getInstance();
  var homeScreenVariable = prefs.getString('HomeScreen');*/
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashScreen(),
    title: "Day To Fortune",
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return onBoardingScreen();
  }
}

//google ads k liye IOS ka setup krna hoga


