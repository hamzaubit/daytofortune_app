import 'package:daytofortune_app/views/drawerMenu/themesScreen.dart';
import 'package:daytofortune_app/views/premiumScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class quoteScreen extends StatefulWidget {

  quoteScreen({required this.quote,required this.author});
  String quote;
  String author;
  @override
  _quoteScreenState createState() => _quoteScreenState();
}

class _quoteScreenState extends State<quoteScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        actions: [
          Icon(Icons.logout,color: Colors.indigo[600],size: SizeConfig.blockSizeHorizontal! * 7,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
          Icon(Icons.favorite_outlined,color: Colors.red,size: SizeConfig.blockSizeHorizontal! * 7,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
        ],
      ),
      body: Column(
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 3.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => themesScreen()));
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
