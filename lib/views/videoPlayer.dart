import 'package:better_player/better_player.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:flutter/material.dart';

class videoPlayer extends StatefulWidget {
  String? videoUrl;
  videoPlayer(this.videoUrl);
  @override
  _videoPlayerState createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(
        backgroundColor: primaryThemeColor,
        title: Text("Day To Fortune",style: TextStyle(color: secondaryThemeColor),),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          "${widget.videoUrl}",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
