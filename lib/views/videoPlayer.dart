import 'package:better_player/better_player.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class videoPlayer extends StatefulWidget {
  String? videoUrl;
  String? title;
  String? thumbnail;

  videoPlayer(this.videoUrl, this.title, this.thumbnail);

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
        title: Text(
          "${widget.title}",
          style: TextStyle(color: secondaryThemeColor),
        ),
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
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 6,
          ),
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

/*
class myAudio extends StatefulWidget {
  @override
  _myAudioState createState() => _myAudioState();
}

class _myAudioState extends State<myAudio> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryThemeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(child: slider()),
          Material(
            child: InkWell(
              onTap: (){
                getAudio();
              },
              child: Icon(
                playing == false ? Icons.play_circle_outline : Icons.pause_circle_outline,size: 100,color: Colors.lightGreenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio() async {
    var url = "https://cf-media.sndcdn.com/R2ZvLoaMlBid.128.mp3?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NmLW1lZGlhLnNuZGNkbi5jb20vUjJadkxvYU1sQmlkLjEyOC5tcDMqIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjM3NjUxOTMyfX19XX0_&Signature=ePscvJInzB9n~bxfDkUtq-Xmzo67NDhJrsg8ZTZBMYA~jQsJgsNsbTU7hlQX8wy4n8zLzEzHPgSkQ8X9hw31M6lKCnN3SFOhGN7Po-vtLMsyTfi-94cyO6n-oNDU5rXCFO4TQz5h1iJF9tJT0-U~7eEfuOb5dm0zK51IKNvE4c5uX7izzPK1cKTasj2P3DGT5~kvDbOKQlP1ZOj8jGyQuoJrCXh6xOyexF4qYeizqwyJOV0E7bnNuVQ1MgPWQ0S8JDynNGQRSb-WRHa5hAqGvnKP-dYk2cjaykPwhba3QUSfEgd~~1xskxSdvMzC0GH2avZM~jDFfpYg2O01utocnQ__&Key-Pair-Id=APKAI6TU7MMXM5DG6EPQ";

    if(playing){
      var result = await audioPlayer.pause();
      if(result == 1){
        setState(() {
          playing = false;
        });
      }
    }
    else{

      var result = await audioPlayer.play(url,isLocal: true);
      if(result == 1){
        setState(() {
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
*/
