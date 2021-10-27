import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class subCategories extends StatefulWidget {
  String? title;
  String? collectionName;
  subCategories(this.title,this.collectionName);
  @override
  _subCategoriesState createState() => _subCategoriesState();
}

class _subCategoriesState extends State<subCategories> {
  @override
  Widget build(BuildContext context) {
    Query adminQuotes = FirebaseFirestore.instance.collection('quotesCategories').doc('quotes').collection(widget.collectionName!);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(backgroundColor: primaryThemeColor,
        centerTitle: true,
        title: Text(widget.title!,style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 5.5),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: adminQuotes.snapshots(),
            builder: (context , stream){
              if(!stream.hasData){
                return Center(child: CircularProgressIndicator(color: secondaryThemeColor,));
              }
              QuerySnapshot? querySnapshot = stream.data;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: querySnapshot?.size,
                itemBuilder: (context , index){
                  return quotesGetter(querySnapshot!.docs[index]['author'].toString(),querySnapshot!.docs[index]['quote'].toString());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class quotesGetter extends StatefulWidget {

  String? author;
  String? quote;
  quotesGetter(this.author,this.quote,);
  @override
  _quotesGetterState createState() => _quotesGetterState();
}

class _quotesGetterState extends State<quotesGetter> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 80),
              Icon(Icons.share,color: secondaryThemeColor,size: SizeConfig.blockSizeHorizontal! * 7,),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
              Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 8),
            child: Text("${widget.quote}",
              style: GoogleFonts.poppins(color: Colors.white,fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          Text("─${widget.author}─",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4),),
          SizedBox(height: SizeConfig.blockSizeVertical! * 12,),
        ],
      ),
    );
  }
}
