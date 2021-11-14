import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/drawerMenu/myQuotes.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/drawerMenu/subCategories.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../premiumScreen.dart';
import 'addingSubCategories.dart';
import 'fortuneAcademy.dart';

class categories extends StatefulWidget {
  String favourites;
  String general;
  String hustle;
  String stress;
  String love;
  String depression;
  String workout;
  String health;
  String training;
  String gym;

  categories(this.general, this.favourites, this.hustle, this.stress, this.love,
      this.depression, this.workout, this.health, this.training, this.gym);

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {

  var loading = true;

  var isPremium;

  isUserPremium() {
    if (FirebaseAuth.instance.currentUser == null) {
      print('Not logged in');
      setState(() {
        isPremium = false;
        loading = false;
      });
    } else {
//  fetch user data
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        print('User');
        setState(() {

          loading = false;
          isPremium = (value.data()?['isPremium']);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isUserPremium();
  }

  @override
  Widget build(BuildContext context) {
    Query categoriesPopularQuote = FirebaseFirestore.instance
        .collection('categories_Pictures')
        .doc("1")
        .collection("Popular_Quotes");
    Query addingRandomQuotesCategories = FirebaseFirestore.instance
        .collection('quotesCategories')
        .doc("quotes")
        .collection("addingNewCategories").doc("1").collection('Motivational');
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: textColor, width: 0.5),
            color: drawerColor,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: drawerColor),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(color: textColor, fontSize: 25),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor, width: 0.5)),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text(
                    'Categories',
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myQuotes()));
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'My Quotes',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => fortuneAcademy()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'Fortune Academy',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => reminderNotification()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'Notifications',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => premiumScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'Get Membership',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signInScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'Sign In',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor, width: 0.5)),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Follow Us!",
                  style: TextStyle(color: textColor, fontSize: 15),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3.5,
                    width: SizeConfig.blockSizeHorizontal! * 7.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/fb.png'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/insta.png'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/tiktok.png'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/twitter.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: loading ? Center(child: CircularProgressIndicator(color: secondaryThemeColor,)) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: SizeConfig.blockSizeVertical! * 35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: drawerColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 8,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Popular Quotes",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 6,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConfig.blockSizeVertical! * 25,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: categoriesPopularQuote.snapshots(),
                            builder: (context, stream) {
                              if (!stream.hasData) {
                                return Container();
                              }
                              QuerySnapshot? querySnapshot = stream.data;
                              return PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: querySnapshot?.size,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: SizeConfig.blockSizeVertical! * 25,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              querySnapshot!.docs[index]['quote']
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      5,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                                          Center(
                                            child: Text(
                                              querySnapshot!.docs[index]['name']
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      5,
                                                  color: secondaryThemeColor),
                                            ),
                                          ),
                                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 8,),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: secondaryThemeColor),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Favourites",'favourites')));
                  },
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 15,
                    width: MediaQuery.of(context).size.width - 25,
                    decoration: BoxDecoration(
                        border: Border.all(color: drawerColor, width: 1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(widget.favourites),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        "Favourites",
                        style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                isPremium? SizedBox():
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                  },
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 15,
                    width: MediaQuery.of(context).size.width - 25,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                        border: Border.all(color: drawerColor, width: 1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                       ),
                    child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("General",'general')));
              },
              child: Container(
                height: SizeConfig.blockSizeVertical! * 10,
                width: MediaQuery.of(context).size.width - 25,
                decoration: BoxDecoration(
                    border: Border.all(color: drawerColor, width: 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(widget.general), fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    "General",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Most Popular",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: secondaryThemeColor),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Hustle",'hustle')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.hustle),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Hustle",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Stress",'stress')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.stress),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Stress",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Love",'love')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.love), fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Love",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Depression",'depression')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.depression),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Depression",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Health & Fitness",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: secondaryThemeColor),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Workout",'workout')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.workout),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Workout",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Health",'health')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.health),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Health",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Training",'training')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.training),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Training",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => subCategories("Gym",'gym')));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: drawerColor, width: 1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(widget.gym), fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "Gym",
                            style: GoogleFonts.poppins(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isPremium? SizedBox(): GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      },
                      child: Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        width: SizeConfig.blockSizeHorizontal! * 45,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: drawerColor, width: 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            /*SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: addingRandomQuotesCategories.snapshots(),
                builder: (context, stream){
                  if (!stream.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: secondaryThemeColor,
                        ));
                  }
                  QuerySnapshot? querySnapshot = stream.data;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: querySnapshot?.size,
                      itemBuilder: (context , index){
                        return addingCategories(
                          querySnapshot!.docs[index]['quoteCategory'].toString(),
                          querySnapshot!.docs[index]['author'].toString(),
                          querySnapshot!.docs[index]['quote'].toString(),
                          querySnapshot!.docs[index]['url'].toString(),
                        );
                      });
                }
            ),*/
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
          ],
        ),
      ),
    );
  }
}

class popularQuotes extends StatefulWidget {
  /*String quote;
  String name;
  popularQuotes(this.quote,this.name);*/

  @override
  _popularQuotesState createState() => _popularQuotesState();
}

class _popularQuotesState extends State<popularQuotes> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          "In all things",
          style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockSizeHorizontal! * 4.7,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 25),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Confucius",
              style: GoogleFonts.poppins(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: secondaryThemeColor),
            ),
          ),
        ),
      ],
    ));
  }
}

class addingCategories extends StatefulWidget {

  bool premium = true;
  String? quoteCategory;
  String? author;
  String? quote;
  String? url;
  addingCategories(this.quoteCategory,this.author,this.quote,this.url);

  @override
  _addingCategoriesState createState() => _addingCategoriesState();
}

class _addingCategoriesState extends State<addingCategories> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,bottom: 15),
      child: Stack
        (
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => addingSubCategories("${widget.quoteCategory}",'${widget.quoteCategory}')));
            },
            child: Container(
              height: SizeConfig.blockSizeVertical! * 15,
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                  border: Border.all(color: drawerColor, width: 1),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(widget.url.toString()),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  "${widget.quoteCategory}",
                  style: GoogleFonts.poppins(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          widget.premium ? SizedBox() :
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
            },
            child: Container(
              height: SizeConfig.blockSizeVertical! * 15,
              width: MediaQuery.of(context).size.width - 25,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                border: Border.all(color: drawerColor, width: 1),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Icon(Icons.lock,size: SizeConfig.blockSizeHorizontal! * 8,color: secondaryThemeColor,),
            ),
          ),
        ],
      ),
    );
  }
}

