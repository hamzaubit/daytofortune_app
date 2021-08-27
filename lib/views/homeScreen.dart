import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/premiumScreen.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawerMenu/categories.dart';
import 'drawerMenu/fortuneAcademy.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(backgroundColor: primaryThemeColor,
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => categories()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                  ),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text('Categories',
                      style: TextStyle(color: textColor,fontSize: 14),),
                  ),
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context , index){
              return quotesGetter();
            },
          ),
        ),
      ),
    );
  }
}
class quotesGetter extends StatefulWidget {
  @override
  _quotesGetterState createState() => _quotesGetterState();
}

class _quotesGetterState extends State<quotesGetter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 80),
                Icon(Icons.logout,color: Colors.indigo[600],size: SizeConfig.blockSizeHorizontal! * 7,),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
                SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text("THE ONLY THING\nSTANDING BETWEEN YOU\nAND YOUR GOAL IS THE\nBULLSHIT STORY YOU KEEP\nTELLING YOURSELF\nAS TO WHY YOU CAN'T\nACHIEVE IT.",
              style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Text("─JORDAN BELFORT",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4),),
          SizedBox(height: SizeConfig.blockSizeVertical! * 12,),
        ],
      ),
    );
  }
}


/*Icon(Icons.logout,color: Colors.indigo[600],size: SizeConfig.blockSizeHorizontal! * 7,),
SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),*/
