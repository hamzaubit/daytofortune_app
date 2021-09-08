import 'package:daytofortune_app/views/onBoardingScreen.dart';
import 'package:flutter/material.dart';

void main(){
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


