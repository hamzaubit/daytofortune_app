import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class confirmAccount extends StatefulWidget {
  @override
  _confirmAccountState createState() => _confirmAccountState();
}

class _confirmAccountState extends State<confirmAccount> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    print("My User ID ${uid!}");
  }

  @override
  void initState() {
    inputData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text("Confirmation",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
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
                            color: secondaryThemeColor.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Center(child: Text("2",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Membership",style: GoogleFonts.poppins(color: secondaryThemeColor.withOpacity(0.5),fontSize: SizeConfig.blockSizeHorizontal! * 3.0))
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
                        child: Center(child: Text("3",style: GoogleFonts.poppins(color: Colors.black,fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            fontWeight: FontWeight.w700))),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                      Text("Confirm Account",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 25,),
            Text("Account Successfully Created",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.0)),
            SizedBox(height: SizeConfig.blockSizeVertical! * 6,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeScreen()));
              },
                child: Text("Tap To Go Home Screen",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.0))),
          ],
        ),
      ),
    );
  }
}
