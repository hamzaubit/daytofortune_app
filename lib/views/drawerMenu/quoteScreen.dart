import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/functions/authFunctions.dart';
import 'package:daytofortune_app/views/drawerMenu/signInScreen.dart';
import 'package:daytofortune_app/views/drawerMenu/themesScreen.dart';
import 'package:daytofortune_app/views/premiumScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class quoteScreen extends StatefulWidget {

  quoteScreen({required this.quote,required this.author});
  String quote;
  String author;
  @override
  _quoteScreenState createState() => _quoteScreenState();
}

class _quoteScreenState extends State<quoteScreen> {

  String? imgUrl;

  getTheme() async {
    final firestoreInstance = await FirebaseFirestore.instance;
    firestoreInstance
        .collection('myQuotes').doc(FirebaseAuth.instance.currentUser?.uid).collection('My Quote').doc("theme")
        .get()
        .then((value) {
      imgUrl = value.data()!["url"];
      print("Get Data ${imgUrl!}");
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Query myTheme = FirebaseFirestore.instance.collection('myCustomTheme').doc('1').collection(FirebaseAuth.instance.currentUser!.uid);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        /*actions: [
          Icon(Icons.logout,color: Colors.indigo[600],size: SizeConfig.blockSizeHorizontal! * 7,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
          Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
        ],*/
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: myTheme.snapshots(),
        builder: (context , stream){
          if(!stream.hasData){
            return Container();
          }
          QuerySnapshot? querySnapshot = stream.data;
          return ListView.builder(
              itemCount: querySnapshot?.size,
              itemBuilder: (context , index){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(querySnapshot!.docs[index]['url'].toString()),
                    fit: BoxFit.fill
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.author,style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
                ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8,left: 15,right: 15),
                      child: Text(widget.quote,style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4.5),),
                    ),
                  )
                ],
              ),
            );
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryThemeColor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3.0,),
              GestureDetector(
                onTap: () async {
                  if(await checkLoggedIn()){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => themesScreen()));
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
                child: Container(
                  height: SizeConfig.blockSizeVertical! * 4.5,
                  width: SizeConfig.blockSizeHorizontal! * 9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/themeIcon.png'),fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                },
                child: Container(
                  height: SizeConfig.blockSizeVertical! * 2,
                  width: SizeConfig.blockSizeHorizontal! * 6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/crown.png'),fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2.0,),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                  },
                  child: Text("Premium",style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 4.0),)),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3.0,),
            ],
          ),
        ),
      ),
    );
  }
}


