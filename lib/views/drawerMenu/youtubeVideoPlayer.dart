import 'dart:developer';

import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeVideoPlayer extends StatefulWidget {
  String? videoUrl;
  String? title;
  String? thumbnail;
  youtubeVideoPlayer(this.videoUrl,this.title,this.thumbnail);
  @override
  _youtubeVideoPlayerState createState() => _youtubeVideoPlayerState();
}

class _youtubeVideoPlayerState extends State<youtubeVideoPlayer> {

  YoutubePlayerController? _controller;
  String? url = 'https://www.youtube.com/watch?v=W-rHIsDFrzQ';

  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoUrl.toString(),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      )
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }
  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller!,)
        , builder: (context , player){
          return Scaffold(
            backgroundColor: primaryThemeColor,
            appBar: AppBar(
              backgroundColor: primaryThemeColor,
              title: Text("${widget.title}",style: TextStyle(color: secondaryThemeColor),),
            ),
            body: Column(
              children: [
                player,
                SizedBox(height: SizeConfig.blockSizeVertical! * 6,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${widget.thumbnail}",
                    style: GoogleFonts.poppins(
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        color: secondaryThemeColor),
                  ),
                ),
              ],
            ),
          );
    });
  }
}


