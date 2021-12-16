import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/drawerMenu/myQuotes.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/drawerMenu/subCategories.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../premiumScreen.dart';
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
  String inpirational;
  String art;
  String change;
  String mom;
  String women;
  String? work;
  String? business;
  String? failure;
  String? leadership;
  String? movingOn;
  String? alone;
  String? death;
  String? sad;
  String? fear;
  String? hope;
  String? life;
  String? wisdom;
  String? imamAli;
  String? motivational;
  String? morning;
  String? patience;
  String? dad;
  String? family;
  String? dating;
  String? fathersDay;
  String? friendship;
  String? jealousy;
  String? marriage;
  String? mothersDay;
  String? parenting;
  String? relationship;
  String? romantic;
  String? attitude;
  String? beauty;
  String? courage;
  String? experience;
  String? forgiveness;
  String? happiness;
  String? freedom;
  String? respect;
  String? strength;
  String? teacher;
  String? thankful;
  String? time;
  String? travel;

  categories(this.general,
      this.favourites,
      this.hustle,
      this.stress,
      this.love,
      this.depression,
      this.workout,
      this.health,
      this.training,
      this.gym,
      this.inpirational,
      this.art,
      this.change,
      this.mom,
      this.women,
      this.work,
      this.business,
      this.failure,
      this.leadership,
      this.movingOn,
      this.alone,
      this.death,
      this.sad,
      this.fear,
      this.hope,
      this.life,
      this.wisdom,
      this.imamAli,
      this.motivational,
      this.morning,
      this.patience,
      this.dad,
      this.family,
      this.dating,
      this.fathersDay,
      this.friendship,
      this.jealousy,
      this.marriage,
      this.mothersDay,
      this.parenting,
      this.relationship,
      this.romantic,
      this.attitude,
      this.beauty,
      this.courage,
      this.experience,
      this.forgiveness,
      this.happiness,
      this.freedom,
      this.respect,
      this.strength,
      this.teacher,
      this.thankful,
      this.time,
      this.travel);

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
          isPremium = (value.data() ? ['isPremium']);
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        centerTitle: true,
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
              color: secondaryThemeColor,
              fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
        ),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homeScreen()));
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 0.5)),
                  child: ListTile(
                    tileColor: drawerColor,
                    title: const Text(
                      'Home',
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
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
                height: SizeConfig.blockSizeVertical! * 10,
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
      body: loading
          ? Center(
          child: CircularProgressIndicator(
            color: secondaryThemeColor,
          ))
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: SizeConfig.blockSizeVertical! * 35,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                          width: SizeConfig.blockSizeHorizontal! * 25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Popular Quotes",
                            style: GoogleFonts.poppins(
                                fontSize:
                                SizeConfig.blockSizeHorizontal! * 6,
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
                        padding:
                        const EdgeInsets.only(left: 10, right: 5),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height:
                                      SizeConfig.blockSizeVertical! *
                                          25,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              querySnapshot!.docs[index]
                                              ['quote']
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                      4.2,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: SizeConfig
                                                .blockSizeVertical! *
                                                2,
                                          ),
                                          Center(
                                            child: Text(
                                              querySnapshot.docs[index]
                                              ['name']
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                      4.3,
                                                  color:
                                                  secondaryThemeColor),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig
                                                .blockSizeHorizontal! *
                                                8,
                                          ),
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
            myText("Categories"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Stack(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories(
                                      "Favourites", 'favourites')));
                    },
                    child: rectangularCategoriesBox(widget.favourites,"Favourites",isPremium),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            subCategories("General", 'general')));
              },
              child: Container(
                height: SizeConfig.blockSizeVertical! * 15,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                decoration: BoxDecoration(
                  color: primaryThemeColor,
                    border: Border.all(color: drawerColor, width: 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(widget.general),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    "General",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                        color:drawerColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Most Popular"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Hustle", 'hustle')));
                      },
                      child: categoriesBox(widget.hustle, "Hustle", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Stress", 'stress')));
                      },
                      child: categoriesBox(widget.stress, "Stress", isPremium),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Love", 'Love')));
                      },
                      child: categoriesBox(widget.love, "Love", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories(
                                        "Depression", 'depression')));
                      },
                      child: categoriesBox(
                          widget.depression, "Depression", isPremium),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Health & Fitness"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Workout", 'workout')));
                      },
                      child: categoriesBox(
                          widget.workout, "Workout", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Health", 'health')));
                      },
                      child: categoriesBox(widget.health, "Health", isPremium),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories(
                                        "Training", 'training')));
                      },
                      child: categoriesBox(
                          widget.training, "Training", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Gym", 'gym')));
                    },
                    child: categoriesBox(widget.gym, "Gym", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Inspiration"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Inspirational", 'Inspirational')));
                },
                child: rectangularCategoriesBox(widget.inpirational,"Inspirational",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Art", 'Art')));
                      },
                      child: categoriesBox(
                          widget.art, "Art", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories("Change", 'Change')));
                      },
                      child: categoriesBox(widget.change, "Change", isPremium),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    subCategories(
                                        "Mom", 'Mom')));
                      },
                      child:categoriesBox(widget.mom, "Mom", isPremium),
                    ),
                  ],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Women", 'Women')));
                    },
                    child: categoriesBox(widget.women, "Women", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Work and Productivity"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Work", 'Work')));
                  },
                  child:categoriesBox(widget.work, "Work", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Business", 'Business')));
                    },
                    child: categoriesBox(widget.business, "Business", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Success"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Failure", 'Failure')));
                },
                child: rectangularCategoriesBox(widget.failure,"Failure",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Leadership", 'Leadership')));
                  },
                  child:categoriesBox(widget.leadership, "Leadership", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Moving On", 'MovingOn')));
                    },
                    child: categoriesBox(widget.movingOn, "Moving On", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Hard Times"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Alone", 'Alone')));
                  },
                  child:categoriesBox(widget.alone, "Alone", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Death", 'Death')));
                    },
                    child: categoriesBox(widget.death, "Death", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Sad", 'Sad')));
                  },
                  child:categoriesBox(widget.sad, "Sad", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Fear", 'Fear')));
                    },
                    child: categoriesBox(widget.fear, "Fear", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Spirituality"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Hope", 'Hope')));
                  },
                  child:categoriesBox(widget.hope, "Hope", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Life", 'Life')));
                    },
                    child: categoriesBox(widget.life, "Life", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Wisdom", 'Wisdom')));
                  },
                  child:categoriesBox(widget.wisdom, "Wisdom", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Imam Ali", 'ImamAli')));
                    },
                    child: categoriesBox(widget.imamAli, "Imam Ali", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Motivation"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Motivational", 'Motivational')));
                },
                child: rectangularCategoriesBox(widget.motivational,"Motivational",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Morning", 'Morning')));
                  },
                  child:categoriesBox(widget.morning, "Morning", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Patience", 'Patience')));
                    },
                    child: categoriesBox(widget.patience, "Patience", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Relationship"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Dad", 'Dad')));
                  },
                  child:categoriesBox(widget.dad, "Dad", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Family", 'Family')));
                    },
                    child: categoriesBox(widget.family, "Family", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Dating", 'Dating')));
                },
                child: rectangularCategoriesBox(widget.dating,"Dating",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Fathers Day", 'FathersDay')));
                  },
                  child:categoriesBox(widget.fathersDay, "Fathers Day", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Friendship", 'Friendship')));
                    },
                    child: categoriesBox(widget.friendship, "Friendship", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Jealousy", 'Jealousy')));
                  },
                  child:categoriesBox(widget.jealousy, "Jealousy", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Marriage", 'Marriage')));
                    },
                    child: categoriesBox(widget.marriage, "Marriage", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Romantic", 'Romantic')));
                },
                child: rectangularCategoriesBox(widget.romantic,"Romantic",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Mothers Day", 'MothersDay')));
                  },
                  child:categoriesBox(widget.mothersDay, "Mothers Day", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Parenting", 'Parenting')));
                    },
                    child: categoriesBox(widget.parenting, "Parenting", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Relationship", 'Relationship')));
                },
                child: rectangularCategoriesBox(widget.relationship,"Relationship",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            myText("Personal Growth"),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Attitude", 'Attitude')));
                  },
                  child:categoriesBox(widget.attitude, "Attitude", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Beauty", 'Beauty')));
                    },
                    child: categoriesBox(widget.beauty, "Beauty", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Courage", 'Courage')));
                  },
                  child:categoriesBox(widget.courage, "Courage", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Experience", 'Experience')));
                    },
                    child: categoriesBox(widget.experience, "Experience", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Forgiveness", 'Forgiveness')));
                  },
                  child:categoriesBox(widget.forgiveness, "Forgiveness", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Happiness", 'Happiness')));
                    },
                    child: categoriesBox(widget.happiness, "Happiness", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              subCategories(
                                  "Freedom", 'Freedom')));
                },
                child: rectangularCategoriesBox(widget.freedom,"Freedom",isPremium)),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Respect", 'Respect')));
                  },
                  child:categoriesBox(widget.respect, "Respect", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Strength", 'Strength')));
                    },
                    child: categoriesBox(widget.strength, "Strength", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Teacher", 'Teacher')));
                  },
                  child:categoriesBox(widget.teacher, "Teacher", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Thankful", 'Thankful')));
                    },
                    child: categoriesBox(widget.thankful, "Thankful", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                subCategories(
                                    "Time", 'Time')));
                  },
                  child:categoriesBox(widget.time, "Time", isPremium),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  subCategories("Travel", 'Travel')));
                    },
                    child: categoriesBox(widget.travel, "Travel", isPremium)),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
          ],
        ),
      ),
    );
  }
}

class categoriesBox extends StatefulWidget {
  String? img;
  String? title;
  bool? isPremium;

  categoriesBox(this.img, this.title, this.isPremium);

  @override
  _categoriesBoxState createState() => _categoriesBoxState();
}

class _categoriesBoxState extends State<categoriesBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical! * 15,
          width: SizeConfig.blockSizeHorizontal! * 45,
          decoration: BoxDecoration(
            color: primaryThemeColor,
              border: Border.all(color: drawerColor, width: 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(widget.img!), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              "${widget.title!}",
              style: GoogleFonts.poppins(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
                  color: drawerColor),
            ),
          ),
        ),
        widget.isPremium!
            ? SizedBox()
            : GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => premiumScreen()));
          },
          child: Container(
            height: SizeConfig.blockSizeVertical! * 15,
            width: SizeConfig.blockSizeHorizontal! * 45,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: drawerColor, width: 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
            child: Icon(
              Icons.lock,
              size: SizeConfig.blockSizeHorizontal! * 8,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}


class rectangularCategoriesBox extends StatefulWidget {

  String? img;
  String? title;
  bool? isPremium;

  rectangularCategoriesBox(this.img, this.title, this.isPremium);

  @override
  _rectangularCategoriesBoxState createState() =>
      _rectangularCategoriesBoxState();
}

class _rectangularCategoriesBoxState extends State<rectangularCategoriesBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical! * 15,
          width: MediaQuery
              .of(context)
              .size
              .width - 20,
          decoration: BoxDecoration(
              color: primaryThemeColor,
              border: Border.all(color: drawerColor, width: 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(widget.img!),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              widget.title!,
              style: GoogleFonts.poppins(
                  fontSize:
                  SizeConfig.blockSizeHorizontal! * 3.8,
                  color: drawerColor),
            ),
          ),
        ),
        widget.isPremium!
            ? SizedBox()
            : GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => premiumScreen()));
          },
          child: Container(
            height: SizeConfig.blockSizeVertical! * 15,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border:
              Border.all(color: drawerColor, width: 1),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
            child: Icon(
              Icons.lock,
              size: SizeConfig.blockSizeHorizontal! * 8,
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}

class myText extends StatelessWidget {
  String titleText;
  myText(this.titleText);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          this.titleText,
          style: GoogleFonts.poppins(
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
              color: secondaryThemeColor),
        ),
      ),
    );
  }
}


