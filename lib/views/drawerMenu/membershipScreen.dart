import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'confirmAccount.dart';

class membershipScreen extends StatefulWidget {
  @override
  _membershipScreenState createState() => _membershipScreenState();
}

class _membershipScreenState extends State<membershipScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text("Sign Up",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical! * 4,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("1",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Account Details",style: GoogleFonts.poppins(color: secondaryThemeColor.withOpacity(0.5),fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("────",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
                  ),
                  Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("2",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Membership",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text("────",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
                  ),
                  Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 7,
                        width: SizeConfig.blockSizeHorizontal! * 14,
                        decoration: BoxDecoration(
                            color: secondaryThemeColor.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("3",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Confirm Account",style: GoogleFonts.poppins(color: secondaryThemeColor.withOpacity(0.5),fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 6,),
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
                Text("Quotes you can't find anywhere else..",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
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
                Text("Only Rs. 266.66/month, nilled annually.",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4),)
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
            Text("30 days free, then just Rs. 3,200.00/year",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4),),
            SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => confirmAccount()));
              },
              child: Container(
                  height: SizeConfig.blockSizeVertical! * 6,
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  decoration: BoxDecoration(
                      color: secondaryThemeColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Proceed",style: GoogleFonts.poppins(fontSize: SizeConfig.blockSizeHorizontal! * 4,color: Colors.black),),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
