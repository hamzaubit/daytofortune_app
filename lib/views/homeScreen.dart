import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/functions/googleAdsService.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/premiumScreen.dart';
import 'package:daytofortune_app/views/reminderNotiffication.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawerMenu/categories.dart';
import 'drawerMenu/fortuneAcademy.dart';
import 'drawerMenu/integrationTests.dart';
import 'drawerMenu/myQuotes.dart';
import 'dart:async';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String? favourites;
  String? general;
  String? hustle;
  String? stress;
  String? love;
  String? depression;
  String? workout;
  String? health;
  String? training;
  String? gym;
  int count = 0;
  AdMobHelper adMobHelper = new AdMobHelper();

  //bool showAd = false;

  getImages() async {
    final firestoreInstance = await FirebaseFirestore.instance;
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Favourites")
        .get()
        .then((value) {
      favourites = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("General")
        .get()
        .then((value) {
      general = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Depression")
        .get()
        .then((value) {
      depression = value.data()!["img"];
    });

    firestoreInstance
        .collection("categories_Pictures")
        .doc("Gym")
        .get()
        .then((value) {
      gym = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Health")
        .get()
        .then((value) {
      health = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Hustle")
        .get()
        .then((value) {
      hustle = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Love")
        .get()
        .then((value) {
      love = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Stress")
        .get()
        .then((value) {
      stress = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Training")
        .get()
        .then((value) {
      training = value.data()!["img"];
    });
    firestoreInstance
        .collection("categories_Pictures")
        .doc("Work out")
        .get()
        .then((value) {
      workout = value.data()!["img"];
    });
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: secondaryThemeColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            backgroundColor: Color(0xff021524),
            title: Text(
              'Confirm!',
              style: GoogleFonts.poppins(
                  color: secondaryThemeColor,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
            ),
            content: Text('Are you sure you want to exit the app?',
                style: GoogleFonts.poppins(
                    color: secondaryThemeColor,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
            actions: [
              FlatButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('Yes',
                    style: GoogleFonts.poppins(
                        color: secondaryThemeColor,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No',
                    style: GoogleFonts.poppins(
                        color: secondaryThemeColor,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.0)),
              ),
            ],
          ),
        );
      },
    );
  }

  saveRandomId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('HomeScreen', "getToHome");
  }

  @override
  void initState() {
    getImages();
    saveRandomId();
    super.initState();
  }

  /*ad() async {
    adMobHelper.createInterAd();
  }*/

  @override
  Widget build(BuildContext context) {
    Query adminQuotes = FirebaseFirestore.instance.collection('adminQuotes');
    Query addMyQuotes = FirebaseFirestore.instance.collection('myQuotes');
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: primaryThemeColor,
        appBar: AppBar(
          backgroundColor: primaryThemeColor,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categories(
                                general.toString(),
                                favourites.toString(),
                                hustle.toString(),
                                stress.toString(),
                                love.toString(),
                                depression.toString(),
                                workout.toString(),
                                health.toString(),
                                training.toString(),
                                gym.toString())));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: textColor, width: 0.5)),
                    child: ListTile(
                      tileColor: drawerColor,
                      title: const Text(
                        'Categories',
                        style: TextStyle(color: textColor, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => myQuotes()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => premiumScreen()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signInScreen()));
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => integrationsTest()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: textColor, width: 0.5)),
                    child: ListTile(
                      tileColor: drawerColor,
                      title: const Text(
                        'Integrations Test',
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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<QuerySnapshot>(
              stream: adminQuotes.snapshots(),
              builder: (context, stream) {
                if (!stream.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: secondaryThemeColor,
                  ));
                }
                QuerySnapshot? querySnapshot = stream.data;
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: querySnapshot?.size,
                  itemBuilder: (context, index) {
                    count = index+1;
                    print(count);
                    return Stack(
                      children: [
                        quotesGetter(
                            querySnapshot!.docs[index]['author'].toString(),
                            querySnapshot!.docs[index]['quote'].toString()),
                        count % 5 == 0 ? adWidget() : Container(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class adWidget extends StatefulWidget {
  @override
  _adWidgetState createState() => _adWidgetState();
}

class _adWidgetState extends State<adWidget> {

  AdMobHelper adMobHelper = new AdMobHelper();

  ad() async {
    adMobHelper.createInterAd();
  }

  @override
  void initState() {
    ad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class quotesGetter extends StatefulWidget {
  String? author;
  String? quote;

  quotesGetter(
    this.author,
    this.quote,
  );

  @override
  _quotesGetterState createState() => _quotesGetterState();
}

class _quotesGetterState extends State<quotesGetter> {

  String formattedDate = DateFormat(' EEE d MMM').format(DateTime.now());

  bool changeColor = false;


  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  createQuotes() {
    var id = getRandomString(25);

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("myQuotes")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('My Quote')
        .doc(id)
      ..set({
        "author": widget.author,
        "quote": widget.quote,
        "date": formattedDate,
        "quoteID": id,
      }).then((_) {
        print("success!");
      });
  }

  @override
  void initState() {
    //startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 80),
              /*Icon(
                Icons.share,
                color: secondaryThemeColor,
                size: SizeConfig.blockSizeHorizontal! * 7,
              ),*/
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 8,
              ),
              GestureDetector(
                onTap: () async{
                  if(await checkLoggedIn()) {
                    createQuotes();
                    setState(() {
                      changeColor = !changeColor;
                    });
                    final snackBar = SnackBar(
                      backgroundColor: primaryThemeColor,
                      content: const Text('Successfully Added To My Quotes'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    final snackBar = SnackBar(
                      backgroundColor: primaryThemeColor,
                      content: const Text('You have to Login first'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signInScreen()));
                  }
                },
                child: Icon(
                  Icons.favorite_outlined,
                  color: changeColor ? secondaryThemeColor : Colors.red,
                  size: SizeConfig.blockSizeHorizontal! * 7,
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "${widget.quote}",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Text(
            "─${widget.author}─",
            style: GoogleFonts.poppins(
                color: secondaryThemeColor,
                fontSize: SizeConfig.blockSizeHorizontal! * 4),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 12,
          ),
        ],
      ),
    );
  }
}

/*Icon(Icons.logout,color: Colors.indigo[600],size: SizeConfig.blockSizeHorizontal! * 7,),
SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),*/
