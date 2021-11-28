import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen.dart';

class allSetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical! * 15,),
          Center(
            child: Container(
              height: SizeConfig.blockSizeVertical! * 20,
              width: SizeConfig.blockSizeHorizontal! * 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                  )
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 10,),
          Text(
            "We are all set!",
            style: GoogleFonts.poppins(
                fontSize: SizeConfig.blockSizeHorizontal! * 6,
                color:secondaryThemeColor),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 6,),
              Container(
                height: SizeConfig.blockSizeVertical! * 2.2,
                width: SizeConfig.blockSizeHorizontal! * 4.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/verify.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Expanded(
                child: Text(
                  "You will periodically receive daily quotes notification based on your preferences",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 5,),
                Container(
                  height: SizeConfig.blockSizeVertical! * 2.2,
                  width: SizeConfig.blockSizeHorizontal! * 4.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/verify.png'),fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                Expanded(
                  child: Text(
                    "Preferences can be changed in category section",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 6.5),
              Container(
                height: SizeConfig.blockSizeVertical! * 2.2,
                width: SizeConfig.blockSizeHorizontal! * 4.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/verify.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Expanded(
                child: Text(
                  "Can disable daily notifications any time",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
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
                    Text("Begin",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 4,color: Colors.black),),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
