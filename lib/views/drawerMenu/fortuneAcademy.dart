import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daytofortune_app/views/homeScreen.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../videoPlayer.dart';

class fortuneAcademy extends StatefulWidget {
  @override
  _fortuneAcademyState createState() => _fortuneAcademyState();
}

class _fortuneAcademyState extends State<fortuneAcademy> {

  String? audioBackground;
  String? videoBackground;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Query trending_audio = FirebaseFirestore.instance.collection('trending_audio');
    Query topFavourite_audio = FirebaseFirestore.instance.collection('topFavourite_audio');
    Query hot10_audio = FirebaseFirestore.instance.collection('hot10_audio');
    Query myCollection_audio = FirebaseFirestore.instance.collection('myCollection_audio');

    Query trending_video = FirebaseFirestore.instance.collection('trending_video');
    Query topFavourite_video = FirebaseFirestore.instance.collection('topFavourite_video');
    Query hot10_video = FirebaseFirestore.instance.collection('hot10_video');
    Query myCollection_video = FirebaseFirestore.instance.collection('myCollection_audio');

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
                    Stack(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 50,
                          child: Center(
                            child: Container(
                              height: SizeConfig.blockSizeVertical! * 13,
                              width: SizeConfig.blockSizeHorizontal! * 28,
                              child: Center(
                                child: CircularProgressIndicator(color: secondaryThemeColor,),
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: trending_video.snapshots(),
                          builder: (context, stream){
                            if(!stream.hasData){
                              return Container();
                            }
                            QuerySnapshot? querySnapshot = stream.data;
                            return backgroundWidget(audioBackground.toString());
                          },
                        ),
                      ],
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: trending_audio.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer((querySnapshot!.docs[index]['url'].toString()))));
                                    },
                                    child: audioWidget(querySnapshot!.docs[index]['img'].toString()));
                              });
                        },
                      ),
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: topFavourite_audio.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return audioWidget(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
                      ),
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: hot10_audio.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return audioWidget(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
                      ),
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: myCollection_audio.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return myCollectionAudio(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 50,
                          child: Center(
                            child: Container(
                              height: SizeConfig.blockSizeVertical! * 13,
                              width: SizeConfig.blockSizeHorizontal! * 28,
                              child: Center(
                                child: CircularProgressIndicator(color: secondaryThemeColor,),
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: trending_video.snapshots(),
                          builder: (context, stream){
                            if(!stream.hasData){
                              return Container();
                            }
                            QuerySnapshot? querySnapshot = stream.data;
                            return backgroundWidget(videoBackground.toString());
                          },
                        ),
                      ],
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
                      height: SizeConfig.blockSizeVertical! * 20,
                      width: MediaQuery.of(context).size.width,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: trending_video.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer((querySnapshot!.docs[index]['url'].toString()))));
                                  },
                                    child: videoWidget(querySnapshot!.docs[index]['img'].toString()));
                              });
                        },
                      ),
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
                      height: SizeConfig.blockSizeVertical! * 20,
                      width: MediaQuery.of(context).size.width,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: topFavourite_video.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return videoWidget(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
                      ),
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
                      height: SizeConfig.blockSizeVertical! * 20,
                      width: MediaQuery.of(context).size.width,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: hot10_video.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return videoWidget(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
                      ),
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: myCollection_video.snapshots(),
                        builder: (context, stream){
                          if(!stream.hasData){
                            return Container();
                          }
                          QuerySnapshot? querySnapshot = stream.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: querySnapshot?.size,
                              itemBuilder: (context , index){
                                return myCollectionVideo(querySnapshot!.docs[index]['img'].toString());
                              });
                        },
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

//for background

class backgroundWidget extends StatefulWidget {

  String img;

  backgroundWidget(this.img);

  @override
  _backgroundWidgetState createState() => _backgroundWidgetState();
}

class _backgroundWidgetState extends State<backgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical! * 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: drawerColor,width: 1),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(widget.img),fit: BoxFit.fill
          )
      ),
    );
  }
}


//for Audios

class audioWidget extends StatefulWidget {

  String img;

  audioWidget(this.img);

  @override
  _audioWidgetState createState() => _audioWidgetState();
}

class _audioWidgetState extends State<audioWidget> {
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
                    image: NetworkImage(widget.img),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}

class myCollectionAudio extends StatefulWidget {

  String img;

  myCollectionAudio(this.img);

  @override
  _myCollectionAudioState createState() => _myCollectionAudioState();
}

class _myCollectionAudioState extends State<myCollectionAudio> {
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
                    image: NetworkImage(widget.img),fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}

//for Videos

class videoWidget extends StatefulWidget {

  String img;

  videoWidget(this.img);

  @override
  _videoWidgetState createState() => _videoWidgetState();
}

class _videoWidgetState extends State<videoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical! * 20,
              width: SizeConfig.blockSizeHorizontal! * 35,
              child: Center(
                child: CircularProgressIndicator(color: secondaryThemeColor,),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 20,
              width: SizeConfig.blockSizeHorizontal! * 35,
              decoration: BoxDecoration(
                  border: Border.all(color: drawerColor,width: 1),
                  image: DecorationImage(
                      image: NetworkImage(widget.img),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ],
        )
    );
  }
}


class myCollectionVideo extends StatefulWidget {

  String img;

  myCollectionVideo(this.img);

  @override
  _myCollectionVideoState createState() => _myCollectionVideoState();
}

class _myCollectionVideoState extends State<myCollectionVideo> {
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
                      image: NetworkImage(widget.img),fit: BoxFit.fill
                  )
              ),
            ),
          ],
        )
    );
  }
}

