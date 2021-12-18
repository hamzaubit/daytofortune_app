import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/drawerMenu/youtubeVideoPlayer.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../videoPlayer.dart';

class mediaList extends StatefulWidget {

  String? categoryTitle;
  String? mainCategory;
  String? categoryCollection;
  mediaList(this.categoryTitle,this.mainCategory,this.categoryCollection,);

  @override
  _mediaListState createState() => _mediaListState();
}

class _mediaListState extends State<mediaList> {
  @override
  Widget build(BuildContext context) {
    Query mediaLis = FirebaseFirestore.instance.collection(widget.mainCategory!).doc("1")
        .collection(widget.categoryCollection!);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text(
          widget.categoryTitle!,
          style: GoogleFonts.poppins(
              color: secondaryThemeColor,
              fontSize: SizeConfig.blockSizeHorizontal! * 6.5),
        ),
      ),
      body: Container(
        height: SizeConfig.blockSizeVertical! * 100,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: mediaLis.snapshots(),
          builder: (context, stream){
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
                  itemBuilder: (context , index){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    videoPlayer(
                                      (querySnapshot!
                                          .docs[index]['url']
                                          .toString()),
                                      (querySnapshot
                                          .docs[index]
                                      ['title']
                                          .toString()),
                                      (querySnapshot
                                          .docs[index]
                                      ['thumbnail']
                                          .toString()),
                                    )));
                      },
                      child: cardWidget(
                        querySnapshot!.docs[index]['title'].toString(),
                        querySnapshot.docs[index]['img'].toString(),
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

class cardWidget extends StatefulWidget {

  String? title;

  String? img;
  cardWidget(this.title,this.img);

  @override
  State<cardWidget> createState() => _cardWidgetState();
}

class _cardWidgetState extends State<cardWidget> {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: SizeConfig.blockSizeVertical! * 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: secondaryThemeColor,
          ),
        ),
        child:  Row(
          children: [
            SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
            Expanded(
                flex: 33,
                child: Container(
                  height: SizeConfig.blockSizeVertical! * 13,
                  width: SizeConfig.blockSizeHorizontal! * 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(widget.img!),
                          fit: BoxFit.fill
                      )
                  ),
                )
            ),
            Expanded(
              flex: 66,
              child: Column(
                children: [
                  Expanded(
                    flex: 50,
                    child: Center(child: Text(
                      widget.title!,
                      style: GoogleFonts.poppins(
                          color: secondaryThemeColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.5),
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

