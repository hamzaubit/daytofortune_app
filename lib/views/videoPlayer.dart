import 'package:better_player/better_player.dart';
import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class videoPlayer extends StatefulWidget {
  String? videoUrl;
  String? title;
  String? thumbnail;

  videoPlayer(this.videoUrl, this.title, this.thumbnail);

  @override
  _videoPlayerState createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {

  WebViewController? _webViewController;

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

/*GestureDetector(
onVerticalDragUpdate : (updateDetails) {},
child: Stack(
children: [
WebView(
initialUrl: widget.videoUrl,
javascriptMode: JavascriptMode.unrestricted,
onWebViewCreated: (WebViewController webViewController) {
_webViewController = webViewController;
},
),
Container(
height: SizeConfig.blockSizeVertical! * 55,
width: MediaQuery.of(context).size.width,
color: Colors.white,
child: Padding(
padding: const EdgeInsets.all(12.0),
child: Center(
child: Column(
children: [
Text(
"Description",
style: TextStyle(color: primaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 5.8),
),
SizedBox(
height: SizeConfig.blockSizeVertical! * 4,

),
Text(
"${widget.thumbnail}",
style: TextStyle(color: primaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 5),
),
],
)
),
),
),
Align(
alignment: Alignment.bottomCenter,
child: Container(
height: SizeConfig.blockSizeVertical! * 7,
width: MediaQuery.of(context).size.width,
color: Colors.white
),
),
],
),
),*/



/*Stack(
          children: [
            WebView(
              initialUrl: widget.videoUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
              },
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 55,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 10),
                    child: Text(
                      "${widget.thumbnail}",
                      style: TextStyle(color: primaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 445),
              child: Container(
                height: SizeConfig.blockSizeVertical! * 13,
                width: MediaQuery.of(context).size.width - 85,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: SizeConfig.blockSizeVertical! * 20,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
          ],
        ),*/


