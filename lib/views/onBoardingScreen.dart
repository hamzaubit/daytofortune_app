import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onBoardingScreen extends StatelessWidget {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => reminderNotification()));
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