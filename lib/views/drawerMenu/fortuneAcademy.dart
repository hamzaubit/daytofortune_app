import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fortuneAcademy extends StatefulWidget {
  @override
  _fortuneAcademyState createState() => _fortuneAcademyState();
}

class _fortuneAcademyState extends State<fortuneAcademy> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primaryThemeColor,
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.1),
            automaticallyImplyLeading: false,
            title: TabBar(
              indicatorColor: secondaryThemeColor,
              tabs: [
              Text("Audios",style: GoogleFonts.poppins(
            fontSize: SizeConfig.blockSizeHorizontal! * 4.7,
            color: Colors.white),),
                Text("Videos",style: GoogleFonts.poppins(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.7,
                    color: Colors.white),)
            ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical! * 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: drawerColor,width: 1),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Trending", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                          itemBuilder: (context , index){
                          return trending();
                      }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Top Favourites", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return topFavourites();
                          }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Hot 10", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return hot10();
                          }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("My Collection", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 21,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                          itemBuilder: (context , index){
                          return myCollection();
                          }
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical! * 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: drawerColor,width: 1),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Trending", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return trending();
                          }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Top Favourites", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return topFavourites();
                          }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("Hot 10", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 15,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return hot10();
                          }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                        child: Text("My Collection", style: GoogleFonts.poppins(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.8,
                            color: secondaryThemeColor),),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 21,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return myCollection();
                          }
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white.withOpacity(0.1),
            currentIndex: 0, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));
                  },
                    child: new Icon(Icons.home,color: secondaryThemeColor,)),
                title: new Text('Home',style: TextStyle(color: secondaryThemeColor,)),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.mail,color: secondaryThemeColor,),
                title: new Text('Messages',style: TextStyle(color: secondaryThemeColor,)),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: secondaryThemeColor,),
                  title: Text('Profile',style: TextStyle(color: secondaryThemeColor,),)
              )
            ],
          ),
        )
    );
  }
}

class trending extends StatefulWidget {
  @override
  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            child: Center(
              child: CircularProgressIndicator(color: secondaryThemeColor,),
            ),
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            decoration: BoxDecoration(
                border: Border.all(color: drawerColor,width: 1),
                image: DecorationImage(
                    image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}

class topFavourites extends StatefulWidget {
  @override
  _topFavouritesState createState() => _topFavouritesState();
}

class _topFavouritesState extends State<topFavourites> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:Stack(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            child: Center(
              child: CircularProgressIndicator(color: secondaryThemeColor,),
            ),
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            decoration: BoxDecoration(
                border: Border.all(color: drawerColor,width: 1),
                image: DecorationImage(
                    image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}

class hot10 extends StatefulWidget {
  @override
  _hot10State createState() => _hot10State();
}

class _hot10State extends State<hot10> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            child: Center(
              child: CircularProgressIndicator(color: secondaryThemeColor,),
            ),
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 13,
            width: SizeConfig.blockSizeHorizontal! * 28,
            decoration: BoxDecoration(
                border: Border.all(color: drawerColor,width: 1),
                image: DecorationImage(
                    image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}

class myCollection extends StatefulWidget {
  @override
  _myCollectionState createState() => _myCollectionState();
}

class _myCollectionState extends State<myCollection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical! * 19,
            width: SizeConfig.blockSizeHorizontal! * 35,
            child: Center(
              child: CircularProgressIndicator(color: secondaryThemeColor,),
            ),
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 19,
            width: SizeConfig.blockSizeHorizontal! * 35,
            decoration: BoxDecoration(
                border: Border.all(color: drawerColor,width: 1),
                image: DecorationImage(
                    image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}



