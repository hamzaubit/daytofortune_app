import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/drawerMenu/quoteScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transparent_image/transparent_image.dart';

import '../premiumScreen.dart';

class themesScreen extends StatefulWidget {
  @override
  _themesScreenState createState() => _themesScreenState();
}

class _themesScreenState extends State<themesScreen> {

  String? imgUrl;

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

  /*getTheme() async {
    final firestoreInstance = await FirebaseFirestore.instance;
    firestoreInstance
        .collection('myQuotes').doc("eNxDazU3FdU3UbYEmTGCECyZ8882").collection('My Quote').doc("theme")
        .get()
        .then((value) {
      imgUrl = value.data()!["url"];
      print("Get Data ${imgUrl!}");
    });
  }*/
  createQuotes(String imageUrl){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('myCustomTheme').doc('1').collection(FirebaseAuth.instance.currentUser!.uid).doc('1')..set(
        {
          "themeEnable" : true,
          "url" : imageUrl,
        }).then((_){
      print("success!");
    });
  }

  @override
  Widget build(BuildContext context) {
    Query themes = FirebaseFirestore.instance.collection('themes');
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: primaryThemeColor,
        appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text("Customize",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
        ),
      body: loading ? Center(child: CircularProgressIndicator(color: secondaryThemeColor,)) :
      Stack(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: StreamBuilder<QuerySnapshot>(
              stream: themes.snapshots(),
              builder: (context, stream){
                if(!stream.hasData){
                  return Container();
                }
                QuerySnapshot? querySnapshot = stream.data;
                return new StaggeredGridView.countBuilder(itemCount: querySnapshot?.size,mainAxisSpacing: 12,crossAxisSpacing: 12,crossAxisCount: 2,itemBuilder: (context , index){
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: GestureDetector(
                          onTap: () async {
                            createQuotes(querySnapshot!.docs[index]['img'].toString());
                            final snackBar = SnackBar(
                              backgroundColor: primaryThemeColor,
                              content: const Text('Theme Successfully Updated'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            //getTheme();
                          },
                          child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: querySnapshot!.docs[index]['img'].toString(),fit: BoxFit.fill,)),
                    ),
                  );
                }, staggeredTileBuilder: (index) {
                  return new StaggeredTile.count(1,index.isEven ? 1.2 : 1.8);
                });
              },
            ),
          ),
          isPremium ? Container(): GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => premiumScreen()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5),
              child: Icon(
                Icons.lock,
                size: SizeConfig.blockSizeHorizontal! * 10,
                color: secondaryThemeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
