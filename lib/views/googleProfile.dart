import 'package:daytofortune_app/views/drawerMenu/signUpScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class googleProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: secondaryThemeColor,),);
        }
        else if(snapshot.hasData){
          return LoggedInWidget();
        }
        else if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong!"),);
        }
      else{
          return signUpScreen();
        }
    });
  }
}

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Text("Logged In"),
          SizedBox(height: SizeConfig.blockSizeVertical! * 10,),
          CircleAvatar(
            radius: SizeConfig.blockSizeHorizontal! * 10,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
          Text("Name : ${user.displayName!}"),
          SizedBox(height: SizeConfig.blockSizeVertical! * 5,),
          Text("Email : ${user.email!!}"),
        ],
      ),
    );
  }
}

