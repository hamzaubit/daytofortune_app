import 'package:better_player/better_player.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class videoPlayer extends StatefulWidget {
  String? videoUrl;
  String? title;
  String? thumbnail;
  videoPlayer(this.videoUrl,this.title,this.thumbnail);
  @override
  _videoPlayerState createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        title: Text("${widget.title}",style: TextStyle(color: secondaryThemeColor),),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              "${widget.videoUrl}",
              betterPlayerConfiguration: BetterPlayerConfiguration(
                aspectRatio: 16 / 9,
              ),
            ),
          ),
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
  }
}

