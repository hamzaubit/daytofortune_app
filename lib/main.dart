import 'package:daytofortune_app/views/onBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
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


