import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/views/drawerMenu/quoteScreen.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class myQuotes extends StatefulWidget {
  @override
  _myQuotesState createState() => _myQuotesState();
}

class _myQuotesState extends State<myQuotes> {
  List<String> author = <String>[];
  List<String> quotes = <String>[];
  String input = "";
  String input1 = "";
  String formattedDate = DateFormat(' EEE d MMM').format(DateTime.now());

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
        "author": input,
        "quote": input1,
        "date": formattedDate,
        "quoteID": id,
      }).then((_) {
        print("success!");
      });
  }

  deleteQuote(input) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("myQuotes")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('My Quote')
        .doc(input)
      ..delete().then((_) {
        print("success!");
      });
  }

  @override
  void initState() {
    super.initState();
/*    author.add("Hamza");
    quotes.add("Quote 1",);*/
  }

  @override
  Widget build(BuildContext context) {
    Query myQuotes = FirebaseFirestore.instance
        .collection('myQuotes')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('My Quote');
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text(
          "My Quotes",
          style: GoogleFonts.poppins(
              color: secondaryThemeColor,
              fontSize: SizeConfig.blockSizeHorizontal! * 6.5),
        ),
        actions: [
          GestureDetector(
              onTap: () async {
                if (await checkLoggedIn()) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text("Add your Quote"),
                          content: Column(
                            children: [
                              Text(
                                "Author Name",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5.5),
                              ),
                              TextField(
                                onChanged: (String value) {
                                  input = value;
                                },
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 3,
                              ),
                              Text(
                                "Quote",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5.5),
                              ),
                              TextField(
                                onChanged: (String value) {
                                  input1 = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                createQuotes();
                                setState(() {
                                  /*author.add(input);
                          quotes.add(input1);*/
                                  Navigator.pop(context);
                                });
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
                                      Text(
                                        "Add",
                                        style: GoogleFonts.poppins(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      });
                } else {
                  final snackBar = SnackBar(
                    backgroundColor: secondaryThemeColor,
                    content: const Text('You have to Login first',style: TextStyle(color: primaryThemeColor)),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signInScreen()));
                }
              },
              child: Icon(
                Icons.add,
                color: secondaryThemeColor,
                size: SizeConfig.blockSizeHorizontal! * 8,
              )),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 3,
          ),
        ],
      ),
      body: Container(
        height: SizeConfig.blockSizeVertical! * 100,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: myQuotes.snapshots(),
          builder: (context, stream) {
            if (!stream.hasData) {
              return Container();
            }
            QuerySnapshot? querySnapshot = stream.data;
            return Container(
              height: SizeConfig.blockSizeVertical! * 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: querySnapshot?.size,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quoteScreen(
                                      quote: querySnapshot!.docs[index]['quote']
                                          .toString(),
                                      author: querySnapshot.docs[index]
                                              ['author']
                                          .toString(),
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Card(
                          color: drawerColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            title: Text(
                              querySnapshot!.docs[index]['author'].toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4.5),
                            ),
                            subtitle: Text(
                              "${querySnapshot.docs[index]['quote'].toString()}\n${querySnapshot.docs[index]['date'].toString()}",
                              style: GoogleFonts.poppins(
                                  color: secondaryThemeColor,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5),
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: secondaryThemeColor,
                                size: SizeConfig.blockSizeHorizontal! * 6,
                              ),
                              onPressed: () {
                                deleteQuote(
                                    querySnapshot.docs[index]['quoteID']);
                                /*setState(() {
                                  quotes.removeAt(index);
                                });*/
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
