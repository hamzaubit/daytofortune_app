import 'dart:async' show Future, Timer;
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class moreQuotes extends StatefulWidget {
  @override
  _moreQuotesState createState() => _moreQuotesState();
}

class _moreQuotesState extends State<moreQuotes> {

  List? data;
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/Inspiration Quotes.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  /*jsonToFirebase(String quote , String author) async {
    await FirebaseFirestore.instance
        .collection('quotesCategories')
        .doc('quotes')
        .collection('inspirational').doc().set({
      'author': author,
      'quote': quote,
    }).then((value){
      print("Data Uploaded");
    });
  }*/

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
          itemCount: data == null ? 0 : data!.length,
          itemBuilder: (BuildContext context, int index) {
          print(data!.length,);
            var quote = data![index]['Quote'];
            var author = data![index]['Author'];
            print(index);
          //jsonToFirebase(quote, author); initial value 1197 se start krna
            return Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    leading: CircleAvatar(
                      child: new Icon(Icons.account_box),
                    ),
                    title: Text(quote),
                    subtitle: Text(author),
                  ),
                  new Divider(),
                ],
              ),
            );
          }),
    );
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
                      backgroundColor: secondaryThemeColor,
                      content: const Text('Successfully Added To My Quotes',style: TextStyle(color: primaryThemeColor),),
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



