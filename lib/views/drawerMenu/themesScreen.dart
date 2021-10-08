import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class themesScreen extends StatefulWidget {
  @override
  _themesScreenState createState() => _themesScreenState();
}

class _themesScreenState extends State<themesScreen> {


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
      body: Container(
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
                    child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: querySnapshot!.docs[index]['img'].toString(),fit: BoxFit.fill,),
                  ),
                );
              }, staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1,index.isEven ? 1.2 : 1.8);
              });
            },
        ),
      )
    );
  }
}
