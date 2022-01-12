import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawerMenu/membershipScreen.dart';

class premiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Column(
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical! * 7,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.centerRight,
                  child: Icon(Icons.cancel_outlined,size: SizeConfig.blockSizeHorizontal! * 8,color: Colors.blueGrey,)),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 7,),
          Container(
            height: SizeConfig.blockSizeVertical! * 8,
            width: SizeConfig.blockSizeHorizontal! * 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/crown.png'),fit: BoxFit.fill
                )
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
          Text("Unlock everything",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
          SizedBox(height: SizeConfig.blockSizeVertical! * 6,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 2.2,
                width: SizeConfig.blockSizeHorizontal! * 4.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Text("Enjoy your first 30 days, it's free.",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 2.5,
                  width: SizeConfig.blockSizeHorizontal! * 5.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/tick.png'),fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                Text("Cancel anytime from the app.",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 2.5,
                width: SizeConfig.blockSizeHorizontal! * 5.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tick.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Text("Quotes you can't find anywhere else.",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 2.5,
                width: SizeConfig.blockSizeHorizontal! * 5.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tick.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Text("Categories for any situation.",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 2.5,
                width: SizeConfig.blockSizeHorizontal! * 5.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tick.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Text("Original Themes, customizable",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 2.5,
                width: SizeConfig.blockSizeHorizontal! * 5.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tick.png'),fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Text("Only 1.51 USD/month, nilled annually.",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
          Text("30 days free, then just 17.99 USD/year",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4),),
          SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => membershipScreen()));
            },
            child: Container(
                height: SizeConfig.blockSizeVertical! * 8,
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                    color: secondaryThemeColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical! * 2.5,
                      width: SizeConfig.blockSizeHorizontal! * 5.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/diamond.png'),fit: BoxFit.fill
                          )
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                    Text(
                      "Go Premium",
                      style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
