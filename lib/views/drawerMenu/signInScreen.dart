import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signInScreen extends StatefulWidget {
  @override
  _signInScreenState createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      body: Column(
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical! * 7,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.cancel_outlined,size: SizeConfig.blockSizeHorizontal! * 8,color: Colors.blueGrey,)),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 7,),
          Text("Log In",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 7.5),),
          SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: SizeConfig.blockSizeHorizontal! * 20,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Username:",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 4.5))),
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                Row(
                  children: [
                    SizedBox(width: SizeConfig.blockSizeHorizontal! * 20,),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: SizeConfig.blockSizeVertical! * 7,
                          width: SizeConfig.blockSizeHorizontal! * 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                hintText: 'Enter a search term'
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
