import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/functions/googleAdsService.dart';
import 'package:daytofortune_app/functions/paymentService.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class integrationsTest extends StatefulWidget {
  @override
  integrationsTestState createState() => integrationsTestState();
}

class integrationsTestState extends State<integrationsTest> {
  AdMobHelper adMobHelper = new AdMobHelper();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text(
          "TESTS",
          style: GoogleFonts.poppins(
              color: secondaryThemeColor,
              fontSize: SizeConfig.blockSizeHorizontal! * 6.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      signOut();
                      await signInWithFacebook();
                      final user = FirebaseAuth.instance.currentUser;
                      print("User Name ${user!.displayName.toString()}");
                      print("User Email ${user!.email.toString()}");
                      print("User ID : ${user.uid}");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Success"),
                            content: new Text(
                                "Welcome, " + user.displayName.toString()),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/fb.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                          Text(
                            "Sign In with Facebook",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      //google ads...
                      adMobHelper.createInterAd();
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/googleLogo.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                          Text(
                            "Google Ads",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      //stripe payment...
                      await makePayment(context, '200', 'USD');
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      width: SizeConfig.blockSizeHorizontal! * 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/stripe_logo.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 8,
                          ),
                          Text(
                            "Stripe Payment",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 6,
            ),
          ],
        ),
      ),
    );
  }
}
