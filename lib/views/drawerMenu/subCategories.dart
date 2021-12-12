import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/functions/googleAdsService.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class subCategories extends StatefulWidget {
  String? title;
  String? collectionName;

  subCategories(this.title, this.collectionName);

  @override
  _subCategoriesState createState() => _subCategoriesState();
}

class _subCategoriesState extends State<subCategories> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    Query adminQuotes = FirebaseFirestore.instance
        .collection('quotesCategories')
        .doc('quotes')
        .collection(widget.collectionName!);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        centerTitle: true,
        title: Text(
          widget.title!,
          style: GoogleFonts.poppins(
              color: secondaryThemeColor,
              fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
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
                  count = index + 1;
                  print(count);
                  return Stack(
                    children: [
                      quotesGetter(
                          querySnapshot!.docs[index]['author'].toString(),
                          querySnapshot.docs[index]['quote'].toString()),
                      count % 5 == 0 ? adWidget() : Container(),
                    ],
                  );
                },
              );
            },
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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 80),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 8,
              ),
              GestureDetector(
                  onTap: () async {
                    if(await checkLoggedIn()){
                      createQuotes();
                      setState(() {
                        changeColor = !changeColor;
                      });
                      final snackBar = SnackBar(
                        backgroundColor: primaryThemeColor,
                        content: const Text('Successfully Added To My Quotes'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else{
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
                  )),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Text(
              "${widget.quote}",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4),
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
