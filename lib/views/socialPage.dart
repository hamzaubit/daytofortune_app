import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class socialWebpage extends StatefulWidget {

  String? url;
  socialWebpage(this.url);

  @override
  _socialWebpageState createState() => _socialWebpageState();
}

class _socialWebpageState extends State<socialWebpage> {

  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerColor,
      ),
      body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          }),
    );
  }
}
