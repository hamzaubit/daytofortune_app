import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../premiumScreen.dart';
import 'fortuneAcademy.dart';

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(backgroundColor: drawerColor,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: textColor,width: 0.5),
            color: drawerColor,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: drawerColor
                ),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(color: textColor,fontSize: 25),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Categories',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('My Quotes',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => fortuneAcademy()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor,width: 0.5)
                  ),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text('Fortune Academy',
                      style: TextStyle(color: textColor,fontSize: 14),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => reminderNotification()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor,width: 0.5)
                  ),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text('Notifications',
                      style: TextStyle(color: textColor,fontSize: 14),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor,width: 0.5)
                  ),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text('Get Membership',
                      style: TextStyle(color: textColor,fontSize: 14),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signInScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor,width: 0.5)
                  ),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text('Sign In',
                      style: TextStyle(color: textColor,fontSize: 14),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Settings',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 18,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Follow Us!",
                  style: TextStyle(color: textColor,fontSize: 15),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3.5,
                    width: SizeConfig.blockSizeHorizontal! * 7.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/fb.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/insta.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/tiktok.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/twitter.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical! * 35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: drawerColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 3,
                  ),
                  Row(
                    children: [
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 8,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Popular Quotes",style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 6,
                            color: Colors.white),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                  Center(
                      child: popularQuotes() // yeh kaam listview builder me krna
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryThemeColor,
                            shape: BoxShape.circle
                        ),
                        height: SizeConfig.blockSizeVertical! * 2.5,
                        width: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 1.5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        height: SizeConfig.blockSizeVertical! * 2.5,
                        width: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 1.5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        height: SizeConfig.blockSizeVertical! * 2.5,
                        width: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 1.5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        height: SizeConfig.blockSizeVertical! * 2.5,
                        width: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 1.5,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        height: SizeConfig.blockSizeVertical! * 2.5,
                        width: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ],
                  )
                ],
              )
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Categories",style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! *5,
                    color: secondaryThemeColor),),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Container(
              height: SizeConfig.blockSizeVertical! * 15,
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                  border: Border.all(color: drawerColor,width: 1),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: Text("Favourites", style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                    color: Colors.white),),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Container(
              height: SizeConfig.blockSizeVertical! * 10,
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                border: Border.all(color: drawerColor,width: 1),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 5),
                child: Text("General", style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                    color: secondaryThemeColor),),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Most Popular",style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! *5,
                    color: secondaryThemeColor),),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Hustle", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 3,),
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Stress", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Love", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 3,),
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Depression", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Health & Fitness",style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! *5,
                    color: secondaryThemeColor),),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Workout", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 3,),
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Health", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Training", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 3,),
                Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: drawerColor,width: 1),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 5),
                    child: Text("Gym", style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
          ],
        ),
      ),
    );
  }
}

class popularQuotes extends StatefulWidget {
  @override
  _popularQuotesState createState() => _popularQuotesState();
}

class _popularQuotesState extends State<popularQuotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("In all things, success depends upon\nprevious preparation, and\nwithout such preparations,\nthere is failure.",
            style: GoogleFonts.poppins(
                fontSize: SizeConfig.blockSizeHorizontal! * 4.7,
                color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,right: 25),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text("Confucius",
                style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: secondaryThemeColor),
              ),
            ),
          ),
        ],
      )
    );
  }
}

