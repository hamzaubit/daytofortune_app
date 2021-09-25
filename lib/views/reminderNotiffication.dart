import 'package:daytofortune_app/views/allSetScreen.dart';
import 'package:daytofortune_app/views/premiumScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reminderNotification extends StatefulWidget {
  @override
  _reminderNotificationState createState() => _reminderNotificationState();
}

class _reminderNotificationState extends State<reminderNotification> {
  int counter = 1;
  bool hustle = false,
      stress = false,
      love = false,
      depression = false,
      workout = false,
      health = false,
      training = false,
      gym = false,
      morning = false,
      noon = false,
      evening = false,
      night = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical! * 17,
              width: MediaQuery.of(context).size.width * 100,
              decoration: BoxDecoration(
                color: primaryThemeColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 15,),
                      Icon(
                        Icons.notifications,
                        size: SizeConfig.blockSizeHorizontal! * 10,
                        color: secondaryThemeColor,
                      ),
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
                    ],
                  ),
                  Text(
                    "Daily Notifications",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 6,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Text(
              "Set daily Motivation reminders.",
              style: GoogleFonts.poppins(
                  fontSize: SizeConfig.blockSizeHorizontal! * 5,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Text(
              "What type of quotes would you like to\nred?",
              style: GoogleFonts.poppins(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        hustle = !hustle;
                      });
                    },
                    child: hustle == true
                        ? Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: primaryThemeColor,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                                Text("Hustle",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          )
                        : Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text("Hustle",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //stress = !stress;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: stress == true
                        ? Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: primaryThemeColor,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                                Text("Stress",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          )
                        : Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text("Stress",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //love = !love;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: love == true
                        ? Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: primaryThemeColor,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                                Text("Love",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          )
                        : Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text("Love",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //depression = !depression;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: depression == true
                        ? Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 28,
                            decoration: BoxDecoration(
                                color: primaryThemeColor,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                                Text("Depression",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          )
                        : Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 26,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text("Depression",
                                    style: GoogleFonts.poppins(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600))),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        //workout =! workout;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: workout == true ? Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 23,
                      decoration: BoxDecoration(
                          color: primaryThemeColor,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor,),
                          Text("Workout",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal! * 3.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ) :
                    Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text("Workout",
                              style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        //health =! health;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: health == true ? Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      decoration: BoxDecoration(
                          color: primaryThemeColor,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor,),
                          Text("Health",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal! * 3.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ) :
                    Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text("Health",
                              style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        //training =! training;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: training == true ? Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      decoration: BoxDecoration(
                          color: primaryThemeColor,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                          Text("Training",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal! * 3.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ) :
                    Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text("Training",
                              style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        //gym =! gym;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => premiumScreen()));
                      });
                    },
                    child: gym == true ? Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      decoration: BoxDecoration(
                          color: primaryThemeColor,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Icon(Icons.cancel,size: SizeConfig.blockSizeVertical! * 3,color: secondaryThemeColor),
                          Text("Gym",
                              style: GoogleFonts.poppins(
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal! * 3.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ) : Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text("Gym",
                              style: GoogleFonts.poppins(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: SizeConfig.blockSizeVertical! * 10,
              color: primaryThemeColor,
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  Text(
                    "How many",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 16,
                  ),
                  counter == 1
                      ? Container(
                          height: SizeConfig.blockSizeVertical! * 6,
                          width: SizeConfig.blockSizeHorizontal! * 12,
                          decoration: BoxDecoration(
                            color: Color(0xff233a40),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: Center(
                                child: Icon(
                              Icons.minimize,
                              size: SizeConfig.blockSizeHorizontal! * 7,
                              color: Colors.grey,
                            )),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              counter--;
                            });
                          },
                          child: Container(
                            height: SizeConfig.blockSizeVertical! * 6,
                            width: SizeConfig.blockSizeHorizontal! * 12,
                            decoration: BoxDecoration(
                              color: Color(0xff233a40),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 13),
                              child: Center(
                                  child: Icon(
                                Icons.minimize,
                                size: SizeConfig.blockSizeHorizontal! * 7,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 7,
                  ),
                  Text("${counter}",
                      style: GoogleFonts.poppins(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                          color: secondaryThemeColor,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 6,
                      width: SizeConfig.blockSizeHorizontal! * 12,
                      decoration: BoxDecoration(
                        color: Color(0xff233a40),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        size: SizeConfig.blockSizeHorizontal! * 7,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  morning ?
                  GestureDetector(
                  onTap: (){
            setState(() {
            morning =! morning;
            });
            },
              child: Container(
                  height: SizeConfig.blockSizeVertical! * 15,
                  width: SizeConfig.blockSizeHorizontal! * 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: SizeConfig.blockSizeVertical! * 2.2,
                            width: SizeConfig.blockSizeHorizontal! * 4.8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical! * 8,
                        width: SizeConfig.blockSizeHorizontal! * 15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/morning.gif')
                            )
                        ),
                      ),
                      Text("Morning"),
                      Text("06-12")
                    ],
                  )
              ),
            ) :
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        morning =! morning;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/morning.gif')
                              )
                            ),
                          ),
                          Text("Morning"),
                          Text("06-12")
                        ],
                      )
                    ),
                  ),
                  noon ?
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        noon =! noon;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: SizeConfig.blockSizeVertical! * 2.2,
                                width: SizeConfig.blockSizeHorizontal! * 4.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/sun.gif')
                                )
                            ),
                          ),
                          Text("Noon"),
                          Text("12-18")
                        ],
                      ),
                    ),
                  ) :
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        noon =! noon;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/sun.gif')
                                )
                            ),
                          ),
                          Text("Noon"),
                          Text("12-18")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  evening ?
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        evening =! evening;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: SizeConfig.blockSizeVertical! * 2.2,
                                width: SizeConfig.blockSizeHorizontal! * 4.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/evening.gif')
                                )
                            ),
                          ),
                          Text("Evening"),
                          Text("18-00")
                        ],
                      ),
                    ),
                  ) :
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        evening =! evening;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/evening.gif')
                                )
                            ),
                          ),
                          Text("Evening"),
                          Text("18-00")
                        ],
                      ),
                    ),
                  ),
                  night ?
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        night =! night;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: SizeConfig.blockSizeVertical! * 2.2,
                                width: SizeConfig.blockSizeHorizontal! * 4.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/selectedTick.png'),fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/night.gif')
                                )
                            ),
                          ),
                          Text("Night"),
                          Text("00-06")
                        ],
                      ),
                    ),
                  ) :
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        night =! night;
                      });
                    },
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 8,
                            width: SizeConfig.blockSizeHorizontal! * 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/night.gif')
                                )
                            ),
                          ),
                          Text("Night"),
                          Text("00-06")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => allSetScreen()));
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
                        "Continue",
                        style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: Colors.black),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
          ],
        ),
      ),
    );
  }
}
