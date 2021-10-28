import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/views/onBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var homeScreenVariable = prefs.getString('HomeScreen');
  print("Value : ${homeScreenVariable}");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homeScreenVariable == null ? onBoardingScreen() : homeScreen(),
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


